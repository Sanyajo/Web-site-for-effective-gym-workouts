package com.example.demo.Service;

import com.example.demo.Models.Slider;
import com.example.demo.Repository.SliderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
@Slf4j
public class SliderService {

    private final SliderRepository sliderRepository;

    public List<Slider> getSliderByType(String type){
        return sliderRepository.findSliderByType(type);
    }

}
