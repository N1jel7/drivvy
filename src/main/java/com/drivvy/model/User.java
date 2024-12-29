package com.drivvy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.util.Base64;
import java.util.List;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "username", unique = true)
    private String username;
    @Column(length = 100)
    private String password;
    @Setter
    @Lob
    private byte[] avatar;
    @Transient
    private String decodedAvatar;
    @OneToMany(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "user_id")
    private List<Car> cars;
    private boolean enabled;
    private LocalDate createdAt;

    @PostLoad
    private void postLoad() {
        decodedAvatar = Base64.getEncoder().encodeToString(avatar);
    }

    public User(String username) {
        this.username = username;
    }

}
