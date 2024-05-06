package com.example.demo.Repository;

import com.example.demo.Models.Price;
import com.example.demo.Models.TrainerUsers;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TrainerUsersRepo extends JpaRepository<TrainerUsers, Long> {

    List<TrainerUsers> findAll();

    TrainerUsers findByEmail(String email);
}
