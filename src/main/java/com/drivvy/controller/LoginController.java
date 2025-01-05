package com.drivvy.controller;

import com.drivvy.dto.response.UserResponseDto;
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

    @GetMapping("/sign-in")
    public String loginPage() {
        return "sign-in";
    }

    @PostMapping("/sign-in")
    public String login(User user) {
        if (loginServiceImpl.login(user.getUsername())) {
            UserResponseDto params = loginServiceImpl.setSessionParam(user.getUsername());
            user.setId(params.id());
            user.setDecodedAvatar(params.decodedAvatar());
            return "redirect:/start";
        } else
            return "redirect:/login";
    }
}
