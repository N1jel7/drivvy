package com.drivvy.controller;

import com.drivvy.model.User;
import com.drivvy.service.AuthServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequiredArgsConstructor
@SessionAttributes("user")
public class LoginController {

    private final AuthServiceImpl loginServiceImpl;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(User user) {
        if (loginServiceImpl.login(user.getUsername())) {
            return "start";
        } else
            return "login";
    }
}
