package com.example.demo.Service;

import com.example.demo.Models.AboutUs;
import com.example.demo.Repository.AboutUsRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AboutUsService {
    private final AboutUsRepo aboutUsRepository;

    public List<AboutUs> getAllAboutUs(){
        return aboutUsRepository.findAll();
    }
}
