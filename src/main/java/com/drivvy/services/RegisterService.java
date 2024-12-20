package com.drivvy.services;

import com.drivvy.models.User;
import com.drivvy.properties.ConfigProperties;
import com.drivvy.repositories.UserRepository;
import freemarker.core.Environment;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RegisterService {
    private final UserRepository userRepository;
    private final ConfigProperties configProperties;

    public boolean register(User user) {
        if(userRepository.findByUsername(user.getUsername()) == null) {
            user.setAvatarByPath(configProperties.getUserImagePath() );
            userRepository.save(user);
            return true;
        }
        else return false;
    }
}
