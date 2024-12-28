package com.drivvy.service;

import com.drivvy.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;

    public Long getUserId(String username) {
        Optional<Long> optionalId = Optional.ofNullable(userRepository.findByUsername(username).getId());
        return optionalId.orElseThrow(() -> new RuntimeException() /*UserNotFoundException*/);
    }


}
