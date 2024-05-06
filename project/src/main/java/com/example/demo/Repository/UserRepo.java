package com.example.demo.Repository;

import com.example.demo.Models.TrainerUsers;
import com.example.demo.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface UserRepo  extends JpaRepository<User, Long> {
    User findByEmail(String email);

    User findByName(String name);

}
