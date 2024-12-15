package com.drivvy.controllers;


import com.drivvy.models.User;
import com.drivvy.repositories.UserRepository;
import com.drivvy.services.SettingsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Base64;

@Controller
@SessionAttributes("user")
public class SettingsController {
    private final UserRepository userRepository;
    private final SettingsService settingsService;

    public SettingsController(UserRepository userRepository, SettingsService settingsService) {
        this.userRepository = userRepository;
        this.settingsService = settingsService;
    }

    @GetMapping("/settings")
    public String settings(@SessionAttribute User user, Model model) {
        User userDb = userRepository.findByUsername(user.getUsername());
        model.addAttribute("user", userDb);
        model.addAttribute("avatar", userDb.getDecodedAvatar());
        return "settings";
    }

    @PostMapping("/settings/update")
    public String infoUpdate(@RequestParam("avatar") MultipartFile avatar, @SessionAttribute User user, Model model) {
        if(avatar != null) {
            User userDb = settingsService.updateAvatar(avatar, user.getId());
            model.addAttribute("avatar", userDb.getDecodedAvatar());
            model.addAttribute("user", userDb);
        }
        return "redirect:/settings";
    }
}
