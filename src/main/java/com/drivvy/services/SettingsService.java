package com.drivvy.services;

import com.drivvy.models.User;
import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Service
@RequiredArgsConstructor
@Slf4j
public class SettingsService {

    private final UserRepository userRepository;

    public User updateAvatar(MultipartFile file, Long id) {
        try {
            byte[] avatar = file.getBytes();
            User userFromDb = userRepository.findUserById(id);
            userFromDb.setAvatar(avatar);
            return userRepository.save(userFromDb);
        } catch (IOException e) {
            log.warn("Error occurred while updating avatar {}",e.getMessage());
        }
        return null;
    }

}