package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CommunityRequestDto;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.CommunityResponseDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.service.impl.CommunityServiceImpl;
import com.drivvy.service.impl.PostServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class CommunityController {

    private final CommunityServiceImpl communityService;
    private final PostServiceImpl postService;

    @GetMapping("/communities")
    public String viewAllCommunities(Model model) {
        model.addAttribute("communities", communityService.getAllGroups());
        return "community/communities";
    }

    @GetMapping("/community/{id}")
    public String viewCommunity(@PathVariable Long id, Model model, @SessionAttribute UserDto userDto) {
        model.addAttribute("isMember", communityService.isUserMember(id, userDto.getId()));
        model.addAttribute("community", communityService.getCommunityDtoById(id));
        return "community/detail";
    }

    @GetMapping("community/creation")
    public String communityCreation() {
        return "community/creation";
    }

    @PostMapping("community/create")
    public String communityCreate(CommunityRequestDto communityRequestDto, MultipartFile avatarFile, @SessionAttribute UserDto userDto) {

        CommunityResponseDto createdCommunity = communityService.create(
                communityRequestDto,
                avatarFile,
                userDto.getId());

        return "redirect:/community/" + createdCommunity.id();
    }

    @GetMapping("communities/{userId}")
    public String viewUserCommunities(@PathVariable Long userId, Model model) {

        return "";
    }

    @GetMapping("community/join/{id}")
    public String joinCommunity(@PathVariable Long id, @SessionAttribute UserDto userDto) {
        communityService.joinUserToCommunity(id, userDto.getId());
        return "redirect:/community/{id}";
    }

    @PostMapping("/community/{id}/post/create")
    public String createPost(
            @PathVariable Long id,
            PostRequestDto postRequestDto,
            List<MultipartFile> filesImages
    ) {
        postService.create(postRequestDto, filesImages, ObjectType.COMMUNITY, id);
        return "redirect:/profile/{id}";
    }
}
