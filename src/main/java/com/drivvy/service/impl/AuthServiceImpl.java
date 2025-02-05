package com.drivvy.service.impl;

import com.drivvy.dto.request.LoginRequestDto;
import com.drivvy.dto.request.RegistrationRequestDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.model.User;
import com.drivvy.service.api.AuthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserServiceImpl userService;
    private final ImageServiceImpl imageService;

    public UserDto login(LoginRequestDto loginRequestDto) {
        return userService.getUserDtoByUsername(loginRequestDto.username());
    }

    public boolean register(RegistrationRequestDto regRequestDto) {
        if (userService.getUserByUsername(regRequestDto.username()) == null) {
            log.info("Saving new user with username: {}", regRequestDto.username());
            userService.saveUser(setUserDefaults(regRequestDto));
            return true;
        }
        return false;
    }

    private User setUserDefaults(RegistrationRequestDto regRequestDto) {
        return User.builder()
                .username(regRequestDto.username())
                .enabled(true)
                .avatar(imageService.setDefaultUserImage())
                .build();
    }
}
