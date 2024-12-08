package com.drivvy.controllers;

import com.drivvy.models.User;
import com.drivvy.repositories.UserRepository;
import com.drivvy.services.LoginService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(User user, Model model) {
        if(loginService.login(user.getUsername())) {
            model.addAttribute("username", user.getUsername());
            return "start";
        } else
            return "login";
    }
}
