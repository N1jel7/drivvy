package com.drivvy.controllers;

import com.drivvy.models.User;
import com.drivvy.services.LoginService;
import com.drivvy.services.RegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class RegisterController {

    private final RegisterService registerService;

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(User user) {
        if(registerService.register(user)) {
            return "login";
        } else
            return "register";
    }
}
