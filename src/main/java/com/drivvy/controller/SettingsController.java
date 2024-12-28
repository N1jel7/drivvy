package com.drivvy.controller;


import com.drivvy.model.User;
import com.drivvy.service.SettingsServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
@Controller
@SessionAttributes("user")
public class SettingsController {

    private final SettingsServiceImpl settingsServiceImpl;

    @GetMapping("/settings")
    public String settings(@SessionAttribute User user, Model model) {
        User userDb = settingsServiceImpl.getUserInfo(user.getUsername());
        model.addAttribute("user", userDb);
        model.addAttribute("avatar", userDb.getDecodedAvatar());
        return "settings";
    }

    @PostMapping("/settings/update")
    public String infoUpdate(@RequestParam("avatar") MultipartFile avatar, @SessionAttribute User user, Model model) {
        if (avatar != null) {
            User userDb = settingsServiceImpl.updateAvatar(avatar, user.getId());
            model.addAttribute("avatar", userDb.getDecodedAvatar());
            model.addAttribute("user", userDb);
        }
        return "redirect:/settings";
    }
}
