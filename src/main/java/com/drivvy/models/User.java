package com.drivvy.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

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
    @Column(name = "username")
    private String username;
    @Setter
    @Lob
    private byte[] avatar;
    @Transient
    private String decodedAvatar;

    @PostLoad
    private void postLoad(){
        decodedAvatar = Base64.getEncoder().encodeToString(avatar);
    }

    public User(String username) {
        this.username = username;
    }

    public void setAvatarByPath(String path) {
        try {
            this.avatar = Files.readAllBytes(new File(path).toPath());
        } catch (IOException e) {
            log.warn("Error occurred while setting avatar {}",e.getMessage());
        }
    }
}
