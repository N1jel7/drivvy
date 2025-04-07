package com.drivvy.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cars")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    private String make;
    private String model;
    private Integer year;
    private Float engineVolume;
    private String engineType;
    private Integer mileage;
    @Column(length = 500)
    private String description;
    @ManyToOne
    private User owner;
    @OneToMany(cascade = CascadeType.PERSIST)
    private List<Image> images = new ArrayList<>();
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    @OneToMany
    private List<Comment> comments;
    @ManyToMany
    private List<User> usersLikes;
    @CreationTimestamp
    private LocalDateTime createdAt;

}
