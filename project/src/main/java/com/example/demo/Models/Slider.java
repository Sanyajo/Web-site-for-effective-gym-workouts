package com.example.demo.Models;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "slider")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Slider {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="type")
    private String type;

    @Column(name="imgurl")
    private String imageUrl;

    @Column(name="info")
    private String sliderInfo;

}
