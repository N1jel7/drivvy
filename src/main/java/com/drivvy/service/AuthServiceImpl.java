package com.drivvy.service;

import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.User;
import com.drivvy.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final ImageServiceImpl imageService;


    public boolean login(String username) {
        return userRepository.findByUsername(username) != null;
    }

    public UserResponseDto setSessionParam(String username) {
        User userDB = userRepository.findByUsername(username);
        return new UserResponseDto(userDB.getId(), userDB.getUsername(), userDB.getDecodedAvatar());
    }

    public boolean register(User user) {
        if (userRepository.findByUsername(user.getUsername()) == null) {
            log.info("Saving new user with username: {}", user.getUsername());
            userRepository.save(setUserDefaults(user));
            return true;
        }
        return false;
    }

    private User setUserDefaults(User user) {
        User userWithDefaults = imageService.setDefaultUserImage(user);
        userWithDefaults.setEnabled(true);
        userWithDefaults.setCreatedAt(LocalDate.now());

        return userWithDefaults;
    }
}
