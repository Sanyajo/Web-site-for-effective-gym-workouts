package com.example.demo.Models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "aboutus")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AboutUs {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="title")
    private String title;

    @Column(name="info")
    private String info;

    @Column(name="iconsurl")
    private String iconsurl;
}
