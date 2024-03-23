package com.example.demo.Repository;

import com.example.demo.Models.Slider;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SliderRepository extends JpaRepository<Slider,Long> {

    List<Slider> findSliderByType(String type);
}
