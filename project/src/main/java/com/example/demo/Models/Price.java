package com.example.demo.Models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "price")
@Data
@NoArgsConstructor
public class Price {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="type")
    private String type;

    @Column(name="price")
    private int price;

    @Column(name="time")
    private String time;

    @Column(name="info")
    private String info;

    public String[] getInfo() {
        return info != null ? info.split(",") : new String[0];
    }

    public void setInfo(String[] info) {
        this.info = info != null ? String.join(",", info) : null;
    }

}
