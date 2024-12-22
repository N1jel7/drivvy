package com.drivvy.services;

import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService implements LoginServiceInterface {
    private final UserRepository userRepository;

    public boolean login(String username) {
        return userRepository.findByUsername(username) != null;
    }
}
