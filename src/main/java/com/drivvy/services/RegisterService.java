package com.drivvy.services;

import com.drivvy.models.User;
import com.drivvy.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RegisterService {
    private final UserRepository userRepository;

    public boolean register(User user) {
        if(userRepository.findByUsername(user.getUsername()) == null) {
            userRepository.save(user);
            return true;
        }
        else return false;
    }
}
