package com.drivvy.service.api;

import com.drivvy.dto.request.LoginRequestDto;
import com.drivvy.dto.request.RegistrationRequestDto;
import com.drivvy.dto.session.UserDto;

public interface AuthService {
    UserDto login(LoginRequestDto loginRequestDto);

    boolean register(RegistrationRequestDto registrationRequestDto);
}
