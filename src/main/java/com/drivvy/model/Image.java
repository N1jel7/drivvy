package com.drivvy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.Base64;

@Slf4j
@Entity
@Table(name = "images")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Lob
    private byte[] image;
    private boolean preview;
    @CreationTimestamp
    private LocalDateTime createdAt;
    @Transient
    private String decodedImage;


    @PostLoad
    private void postLoad() {
        decodedImage = Base64.getEncoder().encodeToString(image);
    }
}
