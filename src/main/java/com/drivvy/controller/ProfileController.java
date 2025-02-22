package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.request.UpdateUserInfoRequestDto;
import com.drivvy.dto.response.CarResponseDto;
import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.CarServiceImpl;
import com.drivvy.service.impl.PostServiceImpl;
import com.drivvy.service.impl.UserServiceImpl;
import com.drivvy.util.CountryUtils;
import lombok.RequiredArgsConstructor;
import org.mapstruct.control.MappingControl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

@RequiredArgsConstructor
@Controller

public class ProfileController {

    private final UserServiceImpl userService;
    private final PostServiceImpl postService;
    private final CarServiceImpl carService;


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

        return "redirect:/profile/" + userDto.getId();
    }

    @GetMapping("/profile/{id}")
    public String viewProfile(@PathVariable Long id, Model model, @SessionAttribute UserDto userDto) {
        UserResponseDto profile = userService.getUserDtoById(id);
        CarResponseDto car = carService.getUserLastCar(id);
        model.addAttribute("userInfo", profile);
        model.addAttribute("car", car);
        model.addAttribute("posts", postService.getPostByObjectId(id, ObjectType.USER));
        if(Objects.equals(id, userDto.getId())) {
            return "user/profile-own";
        } else {
            return "user/profile-view";
        }

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

    @PostMapping("/profile/{id}/post/create")
    public String createPost(
            @PathVariable Long id,
            PostRequestDto postRequestDto,
            List<MultipartFile> filesImages
    ) {
        postService.create(postRequestDto, filesImages, ObjectType.USER, id);
        return "redirect:/profile/{id}";
    }

}
