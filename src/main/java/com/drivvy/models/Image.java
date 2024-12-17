package com.drivvy.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.annotations.CreationTimestamp;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
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

    public void setImageByPath(String path) {
        try {
            this.image = Files.readAllBytes(new File(path).toPath());
        } catch (IOException e) {
            log.warn("Error occurred while setting avatar {}", e.getMessage());
        }
    }

    @PostLoad
    private void postLoad() {
        decodedImage = Base64.getEncoder().encodeToString(image);
    }
}
