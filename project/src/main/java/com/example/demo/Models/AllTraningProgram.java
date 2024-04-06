package com.example.demo.Models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "allprogr")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllTraningProgram {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="progrname")
    private String progrName;

    @Column(name="progrinfo")
    private String progrInfo;

    @Column(name="imgurl")
    private String imageUrl;

    @Column(name="type")
    private String traningType;

    @Column(name="jsonurl")
    private String progrJsonUrl;

    @Column(name="videourl")
    private String videoUrl;

}
