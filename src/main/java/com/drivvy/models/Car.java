package com.drivvy.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Entity
@Table(name = "cars")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String make;
    private String model;
    private String year;
    private String engineVolume;
    private String engineType;
    @Column(name = "user_id")
    private Long userId;
    @OneToMany(cascade = CascadeType.PERSIST)
    private List<Image> images = new ArrayList<>();
    @Transient
    private List<String> decodedImages = new ArrayList<>();

    @PostLoad
    private void postLoad() {
        for (Image image : images) {
            decodedImages.add(Base64.getEncoder().encodeToString(image.getImage()));
        }
    }

    public String getFirstDecodedImage() {
        return decodedImages.getFirst();
    }

    // TODO перенести в сервисный слой
    public void addImageByPath(String path) {
        Image image = new Image();
        image.setImageByPath(path);
        images.add(image);
    }

    // TODO перенести в сервисный слой
    public void addImage(Image image) {
        images.add(image);
    }

}
