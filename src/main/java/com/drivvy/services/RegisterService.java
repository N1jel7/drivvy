package com.drivvy.services;

import com.drivvy.models.User;
import com.drivvy.properties.ConfigProperties;
import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Service
@RequiredArgsConstructor
@Slf4j
public class RegisterService implements RegisterServiceInterface {
    private final UserRepository userRepository;
    private final ConfigProperties configProperties;

    public boolean register(User user) {
        if (userRepository.findByUsername(user.getUsername()) == null) {
            try {
                user.setAvatar(Files.readAllBytes(new File(configProperties.getUserImagePath()).toPath()));
            } catch (IOException e) {
                log.warn("Error occurred while setting avatar {}", e.getMessage());
            }
            userRepository.save(user);
            return true;
        } else return false;
    }
}
