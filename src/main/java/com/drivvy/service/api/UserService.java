package com.drivvy.service.api;

import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.User;

public interface UserService {
    Long getUserId(String username);

    UserResponseDto saveUser(User user);

    User getUserByUsername(String username);
}
