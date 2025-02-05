package com.drivvy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cars")
@Data
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
<<<<<<< Updated upstream
    @Column(name = "user_id")
    private Long userId;
=======
    private Integer mileage;
    @Column(length = 500)
    private String description;
    @ManyToOne
    private User owner;
>>>>>>> Stashed changes
    @OneToMany(cascade = CascadeType.PERSIST)
    private List<Image> images = new ArrayList<>();

}
