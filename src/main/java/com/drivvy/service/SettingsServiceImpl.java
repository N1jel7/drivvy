package com.drivvy.service;

import com.drivvy.model.User;
import com.drivvy.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@RequiredArgsConstructor
@Slf4j
public class SettingsServiceImpl implements SettingsService {

    private final UserRepository userRepository;

    public User updateAvatar(MultipartFile file, Long id) {
        try {
            byte[] avatar = file.getBytes();
            User userFromDb = userRepository.findUserById(id);
            userFromDb.setAvatar(avatar);
            return userRepository.save(userFromDb);
        } catch (IOException e) {
            log.warn("Error occurred while updating avatar {}", e.getMessage());
        }
        return null;
    }

    public User getUserInfo(String username) {
        return userRepository.findByUsername(username);
    }
}
