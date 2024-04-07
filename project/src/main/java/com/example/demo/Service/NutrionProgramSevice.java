package com.example.demo.Service;


import com.example.demo.Models.NutrionProgram;
import com.example.demo.Repository.NutrionProgramRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NutrionProgramSevice {

    private final NutrionProgramRepo nutrionProgramRepo;

    public List<NutrionProgram> getNutrionProgram(String typeProgram) {
        if (typeProgram == null) {
            log.error("Передаваемое значение тренажера равен null !");
            return List.of();
        }
        return nutrionProgramRepo.findByProgrTypeContaining(typeProgram);
    }

    public List<NutrionProgram> getAllNutrionProgram(){
        return nutrionProgramRepo.findAll();
    }
}
