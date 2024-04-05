package com.example.demo.Models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "gymmachines")
@Data
@NoArgsConstructor
public class GymMachines {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="name")
    private String gymMachinesName;

    @Column(name="imageurl")
    private String gymMachimesImageUrl;

    @Column(name="info")
    private String gymMachimesInfo;

    @Column(name="type")
    private String gymMachimesType;


    public String[] getGymMachimesType() {
        return gymMachimesType != null ? gymMachimesType.split(",") : new String[0];
    }

    public void setgymMachimesType(String[] info) {
        this.gymMachimesType = info != null ? String.join(",", info) : null;
    }


}
