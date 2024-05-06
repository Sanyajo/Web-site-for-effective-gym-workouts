package com.example.demo.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "trainerusers")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerUsers {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="email")
    private String email;

    @Column(name="aboutme")
    private String aboutme;

    @Column(name="workexperiens")
    private String workexperiens;

    @Column(name="confirmation")
    private Boolean confirmation;

    @Column(name="trainingType", updatable = true)
    private String trainingtype;

    public String getTrainingtype(){
        return this.trainingtype;
    }

    public String[] getTrainingType() {
        return trainingtype != null ? trainingtype.split(" ") : new String[0];
    }

    public void setTrainingType(String[] program) {
        this.trainingtype = program != null ? String.join(" ", program) : null;
    }
}
