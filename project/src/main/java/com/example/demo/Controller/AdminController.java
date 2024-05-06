package com.example.demo.Controller;

import com.example.demo.Models.TrainerUsers;
import com.example.demo.Models.User;
import com.example.demo.Models.enums.Role;
import com.example.demo.Repository.UserRepo;
import com.example.demo.Service.MailSender;
import com.example.demo.Service.TrainerUsersService;
import com.example.demo.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final TrainerUsersService trainerUsersService;
    private final UserRepo userRepo;
    private final MailSender mailSender;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("trainers",trainerUsersService.getAllTrainer());
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/editrole/{user}")
    public String userRoleEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "usereditrole";
    }

    @PostMapping("/admin/user/editrole")
    public String userRoleEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/editbalance/{user}")
    public String userBalanceEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        return "usereditbalance";
    }

    @PostMapping("/admin/user/editbalance")
    public String userBalanceEdit(@RequestParam("userId") User user, @RequestParam("userBalance") Double userBalance, @RequestParam("balanceAction") String action) {
        userService.changeUserBalance(user, userBalance, action);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/addtrainerrole/{trainer}")
    public String userRoleEditByEmailAdd(@PathVariable("trainer") String trainer, Model model){
        User user = userRepo.findByEmail(trainer);
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        trainerUsersService.refConfirmation(user.getEmail());
        mailSender.send(trainer, "Заявка на тренерство","Вы были приняты на должность тренера");
        return "usereditrole";
    }

    @GetMapping("/admin/user/bantrainerrole/{trainer}")
    public String userRoleEditByEmailBan(@PathVariable("trainer") String trainer, Model model){
        User user = userRepo.findByEmail(trainer);
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        trainerUsersService.deleteTrainerRequest(trainer);
        mailSender.send(trainer, "Заявка на тренерство","Вы не были приняты на должность тренера");
        return "redirect:/admin";
    }



}