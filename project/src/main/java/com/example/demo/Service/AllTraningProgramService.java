package com.example.demo.Service;


import com.example.demo.Models.AllTraningProgram;
import com.example.demo.Repository.AllTraningProgramRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import com.example.demo.JsonModel.Program;

import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AllTraningProgramService {

    private final AllTraningProgramRepo traningProgramRepository;

    public List<AllTraningProgram> getAllTraningProgram(){
        return traningProgramRepository.findAll();
    }

    public AllTraningProgram getTrainByName(String trainName){
        if(trainName != null){
            return traningProgramRepository.findByProgrName(trainName);
        }
        return null;
    }
}
