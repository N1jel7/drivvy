package com.drivvy.service;

import com.drivvy.model.User;

public interface AuthService {
    boolean login(String username);
    boolean register(User user);
}
