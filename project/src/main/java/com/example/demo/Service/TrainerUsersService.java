package com.example.demo.Service;


import com.example.demo.Models.TrainerUsers;
import com.example.demo.Models.User;
import com.example.demo.Models.enums.Role;
import com.example.demo.Repository.TrainerUsersRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class TrainerUsersService {

    private final TrainerUsersRepo trainerUsersRepo;

    public boolean creatRequest(String email, String aboutMe, String workExperiens, String[] selectedPrograms){
        TrainerUsers trainerUsers = new TrainerUsers();
        trainerUsers.setEmail(email);
        trainerUsers.setAboutme(aboutMe);
        trainerUsers.setWorkexperiens(workExperiens);
        trainerUsers.setConfirmation(false);
        trainerUsers.setTrainingType(selectedPrograms);
        trainerUsersRepo.save(trainerUsers);
        return true;
    }

    public List<TrainerUsers> getAllTrainer(){
        return trainerUsersRepo.findAll();
    }

    public boolean deleteTrainerRequest(String email){
        trainerUsersRepo.delete(trainerUsersRepo.findByEmail(email));
        return true;
    }

    public void refConfirmation(String email){
        TrainerUsers trainerUsers  =trainerUsersRepo.findByEmail(email);
        trainerUsers.setConfirmation(true);
        trainerUsersRepo.save(trainerUsers);
    }

    public TrainerUsers getTrainer(String email){
        return trainerUsersRepo.findByEmail(email);
    }
}
