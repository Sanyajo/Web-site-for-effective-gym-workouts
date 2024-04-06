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

    @GetMapping("/main")
    public String redirectMainPage(){
        return "redirect:/SportStorm";
    }

    @GetMapping("/SportStorm")
    public String mainPage(Model model){
        model.addAttribute("listSliderHead", sliderService.getSliderByType("mainWindHead"));
        model.addAttribute("progrList", traningProgramService.getAllTraningProgram());
        model.addAttribute("aboutuslist", aboutUsService.getAllAboutUs());
        model.addAttribute("priceList", priceService.getAllPrice());
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


    @PostMapping("/traning-program/{progrName}")
    public String traningProgramInDetail(@PathVariable String progrName, Model model) throws IOException {
        AllTraningProgram allTraningProgram = traningProgramService.getTrainByName(progrName);
        model.addAttribute("trainprogr", allTraningProgram);
        model.addAttribute("gymMachinesList",gymMachinesService.getGymMachines(allTraningProgram.getTraningType()));
        model.addAttribute("progrList", jsonService.getProgram(progrName));
        return "traningprogramdetail";
    }

    @GetMapping("/gymmachines")
    public String gymMachines(Model model){
        model.addAttribute("gymmachinelist", gymMachinesService.getAllGymMachines());
        return "gymmachines";
    }

}
