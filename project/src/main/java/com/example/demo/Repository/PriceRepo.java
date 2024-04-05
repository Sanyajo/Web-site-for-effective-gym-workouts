package com.example.demo.Repository;

import com.example.demo.Models.Price;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PriceRepo extends JpaRepository<Price, Long> {
    List<Price> findAll();
}
