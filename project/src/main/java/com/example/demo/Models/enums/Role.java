package com.example.demo.Models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER, ROLE_ADMIN, ROLE_TRAINER;

    @Override
    public String getAuthority(){
        return name();
    }
}
