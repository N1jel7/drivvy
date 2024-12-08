package com.drivvy.services;

import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final UserRepository userRepository;

    public boolean login(String username) {
        if(userRepository.findByUsername(username) != null) {
            return true;
        } else return false;
     }
}
