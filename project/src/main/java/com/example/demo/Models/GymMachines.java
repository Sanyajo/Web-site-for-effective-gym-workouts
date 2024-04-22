package com.example.demo.Models;

import javax.persistence.*;
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

    @Column(name="musclegroup")
    private String muscleGroup;

    public String[] getGymMachimesType() {
        return gymMachimesType != null ? gymMachimesType.split(",") : new String[0];
    }

    public void setgymMachimesType(String[] info) {
        this.gymMachimesType = info != null ? String.join(",", info) : null;
    }

    public String getMuscleGroupStr(){
        return this.muscleGroup;
    }

    public String[] getMuscleGroup(){
        return muscleGroup != null ? muscleGroup.split(",") : new String[0];
    }

    public void setMuscleGroup(String[] info) {
        this.muscleGroup = info != null ? String.join(",", info) : null;
    }

}
