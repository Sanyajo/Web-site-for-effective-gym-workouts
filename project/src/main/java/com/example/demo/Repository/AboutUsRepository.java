package com.example.demo.Repository;

import com.example.demo.Models.AboutUs;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface AboutUsRepository extends JpaRepository<AboutUs, Long> {
    List<AboutUs> findAll();
}
