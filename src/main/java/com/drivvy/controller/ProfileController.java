package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CommentRequestDto;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
        UserResponseDto userInfo = userService.getUserDtoById(id);
        CarResponseDto car = carService.getUserLastCar(id);
        model.addAttribute("profileInfo", userService.getProfileInfo(id));
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("car", car);
        model.addAttribute("posts", postService.getPostsByObjectId(id, ObjectType.USER));

        boolean isOwner = Objects.equals(id, userDto.getId());

        model.addAttribute("isOwner", isOwner);
        return "/user/profile-detail";
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

    @GetMapping("/profile/{profileId}/post/{postId}/like")
    public String likePost(@PathVariable Long postId, @PathVariable Long profileId, @SessionAttribute UserDto userDto) {
        postService.likeOrDislikePost(userDto.getId(), postId);
        return "redirect:/profile/{profileId}";
    }

    @PostMapping("/profile/{userId}/post/{postId}/comment")
    public String leaveComment(
            @PathVariable Long userId,
            @PathVariable Long postId,
            String content,
            @SessionAttribute UserDto userDto) {
        postService.addCommentToPost(new CommentRequestDto(userDto.getId(), postId, content));
        return "redirect:/profile/" + userId;
    }

    @PostMapping("/profile/{userId}/post/{postId}/edit")
    public String editPost(@PathVariable Long userId ,@PathVariable Long postId, PostRequestDto postRequestDto) {
        postService.editPost(postRequestDto, postId);
        return "redirect:/profile/{userId}";
    }

    @GetMapping("/profile/{userId}/post/{postId}/delete")
    public String deletePost(@PathVariable Long userId ,@PathVariable Long postId) {
        postService.deletePost(postId);
        return "redirect:/profile/" + userId;
    }

    @PostMapping("/profile/{id}/post/create")
    public String createPost(
            @PathVariable Long id,
            PostRequestDto postRequestDto
    ) {
        postService.create(postRequestDto, ObjectType.USER, id);
        return "redirect:/profile/{id}";
    }

}
