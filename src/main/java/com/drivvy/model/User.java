package com.drivvy.model;

import com.drivvy.dto.common.Gender;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(unique = true)
    private String username;

    @Column(length = 100)
    private String password;

    @OneToOne
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private Image avatar;

    private boolean enabled;

    @CreationTimestamp
    private LocalDateTime createdAt;

    private String firstname;

    private String lastname;

    private String country;

    private String city;

    private Gender gender;

    @DateTimeFormat(pattern = "MM-dd-YYYY")
    private LocalDate birthday;

    private String email;

}