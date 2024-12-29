package com.drivvy.controller;

import com.drivvy.model.User;
import com.drivvy.service.AuthServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class RegisterController {

    private final AuthServiceImpl authService;

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(User user) {
        if (authService.register(user)) {
            return "redirect:/login";
        } else
            return "redirect:/register";
    }
}
