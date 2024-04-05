package com.example.demo.Service;

import com.example.demo.Models.GymMachines;
import com.example.demo.Repository.GymMachinesRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class GymMachinesService {

    private final GymMachinesRepo gymMachinesRepo;

    public List<GymMachines> getGymMachines(String typeGymMachine) {
        if (typeGymMachine == null) {
            log.error("Передаваемое значение тренажера равен null !");
            return List.of();
        }

        return gymMachinesRepo.findByGymMachimesTypeContaining(typeGymMachine);
    }
}
