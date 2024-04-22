package com.example.demo.Models;

import javax.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "nutritionprogr")
@Data
@NoArgsConstructor
public class NutrionProgram {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="morning")
    private String morning;

    @Column(name="refreshment")
    private String refreshment;

    @Column(name="lunch")
    private String lunch;

    @Column(name="afternoon")
    private String afternoon;

    @Column(name="progrtype")
    private String progrType;

    @Column(name="calories")
    private String calories;

    @Column(name="pfc")
    private String pfc;

    public String getNutrionByProgrType(){
        return this.progrType;
    }

    public String[] getProgrType() {
        return progrType != null ? progrType.split(",") : new String[0];
    }

    public void setProgrType(String[] progrType) {
        this.progrType = progrType != null ? String.join(",", progrType) : null;
    }
}
