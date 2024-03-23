package com.example.demo.Service;


import com.example.demo.Models.AllTraningProgram;
import com.example.demo.Repository.AllTraningProgramRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AllTraningProgramService {

    private final AllTraningProgramRepository traningProgramRepository;

    public List<AllTraningProgram> getAllTraningProgram(){
        return traningProgramRepository.findAll();
    }
}
