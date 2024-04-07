package com.example.demo.Repository;

import com.example.demo.Models.NutrionProgram;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NutrionProgramRepo extends JpaRepository<NutrionProgram, Long> {

    List<NutrionProgram> findByProgrTypeContaining(String progrType);
}
