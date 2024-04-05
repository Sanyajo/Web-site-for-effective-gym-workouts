package com.example.demo.Repository;

import com.example.demo.Models.GymMachines;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GymMachinesRepo extends JpaRepository<GymMachines, Long> {
    List<GymMachines> findByGymMachimesTypeContaining(String typeGymMachine);
}
