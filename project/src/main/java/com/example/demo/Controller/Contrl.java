package com.example.demo.Controller;

import com.example.demo.Models.AllTraningProgram;
import com.example.demo.Service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class Contrl {

    private final SliderService sliderService;
    private final AllTraningProgramService traningProgramService;
    private final AboutUsService aboutUsService;
    private final PriceService priceService;
    private final GymMachinesService gymMachinesService;
    private final JsonService jsonService;
    private final NutrionProgramSevice nutrionProgramSevice;
    private final UserService userService;
    private final TrainerUsersService trainerUsersService;

    @GetMapping("/main")
    public String redirectMainPage(){
        return "redirect:/SportStorm";
    }

    @GetMapping("/")
    public String MainPage(){
        return "redirect:/SportStorm";
    }

    @GetMapping("/SportStorm")
    public String mainPage(Model model){
        model.addAttribute("listSliderHead", sliderService.getSliderByType("mainWindHead"));
        model.addAttribute("progrList", traningProgramService.getAllTraningProgram());
        model.addAttribute("aboutuslist", aboutUsService.getAllAboutUs());
        model.addAttribute("priceList", priceService.getAllPrice());

        model.addAttribute("carSliderListBody", userService.getAllUsers());

        return "main";
    }

    @GetMapping("/traningProgram")
    public String redirectTraningProgram(){
        return "redirect:/traning-program";
    }

    @GetMapping("/traning-program")
    public String traningProgram(Model model){
        model.addAttribute("progrList", traningProgramService.getAllTraningProgram());
        return "traningprogram";
    }


    @PostMapping("/traning-programm/{progrName}")
    public String traningDetail(@PathVariable String progrName, Model model) throws IOException {
        AllTraningProgram allTraningProgram = traningProgramService.getTrainByName(progrName);
        model.addAttribute("traningprogr", allTraningProgram);
        model.addAttribute("gymMachinesList",gymMachinesService.getGymMachines(allTraningProgram.getTraningType()));
        model.addAttribute("progrList", jsonService.getProgram(progrName));
        return "traningDetail";
    }

    @GetMapping("/gymmachines")
    public String redirectGymMachines(){return "redirect:/gym-machines";}

    @GetMapping("/gym-machines")
    public String gymMachines(Model model){
        model.addAttribute("gymmachinelist", gymMachinesService.getAllGymMachines());
        return "gymmachines";
    }

    @GetMapping("/nutrionprogram")
    public String redirectNutrionProgram(){return "redirect:/nutrion-program";}

    @GetMapping("/nutrion-program")
    public String nutrionProgram(Model model){
        model.addAttribute("nutrionprogramlist", nutrionProgramSevice.getAllNutrionProgram());
        return "nutrionprogram";
    }

    @GetMapping("/alltrainer")
    public String redirectAllTrainer(){
        return "redirect:/all-trainer";
    }

    @GetMapping("/all-trainer")
    public String alltrainer(Model model){
        model.addAttribute("user", userService);
        model.addAttribute("alltrainerlist", trainerUsersService.getAllTrainer());
        return "alltrainer";
    }

}
