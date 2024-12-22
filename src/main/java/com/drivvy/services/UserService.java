package com.drivvy.services;

import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService implements UserServiceInterface {

    private final UserRepository userRepository;

    public Long getUserId(String username) {
        return userRepository.findByUsername(username).getId();
    }
}
