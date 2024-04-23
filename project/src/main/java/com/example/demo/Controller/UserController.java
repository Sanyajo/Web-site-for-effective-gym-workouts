package com.example.demo.Controller;


import com.example.demo.JsonModel.Program;
import com.example.demo.Models.AllTraningProgram;
import com.example.demo.Models.NutrionProgram;
import com.example.demo.Repository.UserRepo;
import com.example.demo.Service.*;
import lombok.RequiredArgsConstructor;
import com.example.demo.Models.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final SliderService sliderService;
    private final AllTraningProgramService traningProgramService;
    private final JsonService jsonService;
    private final UserRepo userRepository;
    private final NutrionProgramSevice nutrionProgramSevice;

    @GetMapping("/login")
    public String login(Model model){
//        String urlBackWallp = sliderService.getSliderByType("mainWindHead").get(0).getImageUrl();
        model.addAttribute("backWallp",sliderService.getSliderByType("mainWindHead").get(0).getImageUrl());
        return "login";
    }

    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("backWallp",sliderService.getSliderByType("mainWindHead").get(0).getImageUrl());
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        model.addAttribute("backWallp",sliderService.getSliderByType("mainWindHead").get(0).getImageUrl());
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            log.info("Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/hello")
    public String securityUrl(){
        return "hello";
    }

    @GetMapping("/account")
    public String userAccaunt(Principal principal, Model model) throws IOException {
        User user = userService.getUserByPrincipal(principal);
            model.addAttribute("user", user);

            List<AllTraningProgram> allTraningPrograms = traningProgramService.getAllTraningProgram();
            List<String> programName = new ArrayList<>();
            List<Program> programList = new ArrayList<>();
            for(var i: allTraningPrograms){
                Program[] programs = jsonService.getAllProgramName(i.getProgrJsonUrl());
                for(var j: programs){
                    programList.add(j);
                    programName.add(j.getProgrName());
                }
            }
            model.addAttribute("progrListName", programName);
            model.addAttribute("allProgram", programList);


            List<NutrionProgram> nutrionProgramsList = nutrionProgramSevice.getAllNutrionProgram();

            List<Integer> nutrionProgramName = new ArrayList<>();
            for(var i : nutrionProgramsList){
                nutrionProgramName.add(i.getId());
            }


            model.addAttribute("nutrionProgramNameList",nutrionProgramName);
            model.addAttribute("nutrionprogramlist",nutrionProgramsList);

            model.addAttribute("lastprogramlist", user.getLastProgramArray());

            model.addAttribute("kollTraining",userService.getCountTraining(user));
            model.addAttribute("countRepeat",userService.getCountRepeat(user)[0]);
            model.addAttribute("countApproaches",userService.getCountRepeat(user)[1]);
            return "user";

    }

    @PostMapping("/endTraining")
    public String endTraining(Principal principal, @RequestParam("selectedProgram") String selectedProgram) {
        // Вывод информации о Principal в консоль
        System.out.println("Principal: " + principal);

        System.out.println(selectedProgram);

        // Получение пользователя из сервиса пользователя
        User user = userService.getUserByPrincipal(principal);

        // Вывод информации о пользователе в консоль
        System.out.println("User: " + user);

        // Проверка, что пользователь не равен null
        if (user != null) {
            userService.addLastTraning(user, selectedProgram);
        } else {
            System.out.println("User is null. Unable to add last training.");
        }

        return "redirect:/account";
    }

    @PostMapping("/renameuser")
    @ResponseBody
    public Map<String, Object> renameUser(Principal principal, @RequestParam("userName") String userName) {
        User user = userService.getUserByPrincipal(principal);
        return userService.renameUser(user, userName);
    }


    @PostMapping("/changeuserpassword")
    public String changeUserPassword(Principal principal,@RequestParam("password") String userPassword){
        User user = userService.getUserByPrincipal(principal);
        userService.changeUserPassword(user, userPassword);
        return "redirect:/account";
    }

    @PostMapping("/changeavatar")
    public String changeUserAwatar(Principal principal, @RequestParam("photo") MultipartFile urlImages) throws IOException {
        System.out.println(urlImages.toString());
        User user = userService.getUserByPrincipal(principal);
        userService.changeUserAvatar(user, urlImages);
        return "redirect:/account";
    }

}
