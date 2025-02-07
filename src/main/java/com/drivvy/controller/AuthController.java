package com.drivvy.controller;

import com.drivvy.dto.request.LoginRequestDto;
import com.drivvy.dto.request.RegistrationRequestDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.AuthServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequiredArgsConstructor
@SessionAttributes("userDto")
public class AuthController {

    private final AuthServiceImpl authService;

    @GetMapping("/sign-in")
    public String loginPage() {
        return "auth/sign-in";
    }

    @PostMapping("/sign-in")
    public String login(LoginRequestDto loginRequestDto, HttpSession session) {
        UserDto user = authService.login(loginRequestDto);
        if (user != null) {
            session.setAttribute("userDto", user);
            return "redirect:/start";
        } else
            return "redirect:/login";

    }

    @GetMapping("/sign-up")
    public String registerPage() {
        return "auth/sign-up";
    }

    @PostMapping("/sign-up")
    public String register(RegistrationRequestDto registrationRequestDto) {
        if (authService.register(registrationRequestDto)) {
            return "redirect:/sign-in";
        } else
            return "redirect:/sign-up";
    }
}
