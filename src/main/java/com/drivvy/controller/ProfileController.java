package com.drivvy.controller;

import com.drivvy.dto.request.UpdateUserInfoRequestDto;
import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.UserServiceImpl;
import com.drivvy.util.CountryUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
@Controller

public class ProfileController {

    private final UserServiceImpl userService;


    @PostMapping("/profile-edit/update/personal-info")
    public String profileUpdate(
            @RequestParam("avatarFile") MultipartFile avatarFile,
            UpdateUserInfoRequestDto requestDto,
            Model model,
            @SessionAttribute UserDto userDto) {

        UserResponseDto userResponseDto = userService.updateUserData(
                avatarFile,
                userDto.getId(),
                requestDto);

        model.addAttribute("userInfo", userResponseDto);

        return "redirect:/profile-edit";
    }

    @GetMapping("/profile/{id}")
    public String viewProfile(@PathVariable Long id, Model model) {
        UserResponseDto profile = userService.getUserDtoById(id);
        model.addAttribute("userInfo", profile);
        return "user/profile";
    }

    @GetMapping("/profile-edit")
    public String profileEdit(@SessionAttribute UserDto userDto, Model model) {
        UserResponseDto userResponseDto = userService.getUserDtoById(userDto.getId());
        model.addAttribute("userInfo", userResponseDto);
        model.addAttribute("countries", CountryUtils.getCountries());
        return "user/profile-edit";
    }

    @GetMapping("/account-edit")
    public String accountEdit() {

        return "user/account-edit";
    }

    @GetMapping("/privacy-edit")
    public String privacyEdit() {

        return "user/privacy-edit";
    }

}
