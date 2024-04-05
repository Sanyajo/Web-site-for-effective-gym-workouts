package com.example.demo.Service;


import com.example.demo.JsonModel.Program;
import com.example.demo.Models.AllTraningProgram;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

@Service
@RequiredArgsConstructor
@Slf4j
public class JsonService {

    private final AllTraningProgramService traningProgramService;
    public Program[] getProgram(String progrName) throws IOException {

        AllTraningProgram allTraningProgram = traningProgramService.getTrainByName(progrName);
        ObjectMapper mapper = new ObjectMapper();
        File file = new File(allTraningProgram.getProgrJsonUrl());

        // Deserialize array of Program objects
        Program[] programs = mapper.readValue(file, Program[].class);

        return  programs;
    }
}
