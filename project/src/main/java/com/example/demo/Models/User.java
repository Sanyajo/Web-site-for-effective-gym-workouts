package com.example.demo.Models;

import com.example.demo.Models.enums.Role;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.awt.*;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="users")
@Data
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="email")
    private String email;

    @Column(name="phonenumber")
    private String phoneNumber;

    @Column(name="name")
    private String name;

    @Column(name="active")
    private boolean active;

    @Column(name="avatarurl")
    private String avatar;

    @Column(name = "password", length = 1000)
    private String password;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();

    @Column(name="typesub")
    private String typeSub;

    @CollectionTable(name="user_balance",
            joinColumns = @JoinColumn(name="user_balance"))
    private Double userBalance;

    private LocalDateTime dateOfCreated;

    @Column(name="lastProgramArray", updatable = true)
    private String lastProgramArray;


    public String[] getLastProgramArray() {
        return lastProgramArray != null ? lastProgramArray.split(",") : new String[0];
    }

    public void setLastProgramArray(String[] program) {
        this.lastProgramArray = program != null ? String.join(",", program) : null;
    }

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
