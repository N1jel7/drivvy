package com.drivvy.controller;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CommentRequestDto;
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

@RequiredArgsConstructor
@Controller
public class CommunityController {

    private final CommunityServiceImpl communityService;
    private final PostServiceImpl postService;

    @GetMapping("/communities")
    public String viewAllCommunities(Model model) {
        model.addAttribute("communities", communityService.getAllCommunities());
        return "community/global-communities";
    }

    @GetMapping("/community/{id}")
    public String viewCommunity(@PathVariable Long id, Model model, @SessionAttribute UserDto userDto) {
        model.addAttribute("isCreator", communityService.isCreator(id, userDto.getId()));
        model.addAttribute("isMember", communityService.isUserMember(id, userDto.getId()));
        model.addAttribute("community", communityService.getCommunityDtoById(id));
        model.addAttribute("posts", postService.getPostsByObjectId(id, ObjectType.COMMUNITY));
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

    @GetMapping("community/{communityId}/leave")
    public String leaveCommunity(@PathVariable Long communityId, @SessionAttribute UserDto userDto) {
        communityService.removeUserFromCommunity(communityId, userDto.getId());
        return "redirect:communities/" + userDto.getId();
    }

    @GetMapping("communities/{userId}")
    public String viewUserCommunities(@PathVariable Long userId, Model model) {
        model.addAttribute("communities", communityService.getUserCommunities(userId));
    return "community/user-communities";
    }

    @GetMapping("community/join/{id}")
    public String joinCommunity(@PathVariable Long id, @SessionAttribute UserDto userDto) {
        communityService.joinUserToCommunity(id, userDto.getId());
        return "redirect:/community/{id}";
    }

    @GetMapping("/community/{communityId}/post/{postId}/like")
    public String likePost(@PathVariable Long postId, @PathVariable Long communityId, @SessionAttribute UserDto userDto) {
        postService.likeOrDislikePost(userDto.getId(), postId);
        return "redirect:/community/{communityId}";
    }

    @PostMapping("/community/{communityId}/post/{postId}/comment")
    public String leaveComment(
            @PathVariable Long communityId,
            @PathVariable Long postId,
            String content,
            @SessionAttribute UserDto userDto) {
        postService.addCommentToPost(new CommentRequestDto(userDto.getId(), postId, content));
        return "redirect:/community/{communityId}";
    }

    @PostMapping("/community/{communityId}/post/{postId}/edit")
    public String editPost(@PathVariable Long communityId ,@PathVariable Long postId, PostRequestDto postRequestDto) {
        postService.editPost(postRequestDto, postId);
        return "redirect:/community/{communityId}";
    }

    @GetMapping("/community/{communityId}/post/{postId}/delete")
    public String deletePost(@PathVariable Long communityId ,@PathVariable Long postId) {
        postService.deletePost(postId);
        return "redirect:/community/{communityId}";
    }

    @PostMapping("/community/{communityId}/post/create")
    public String createPost(
            @PathVariable Long communityId,
            PostRequestDto postRequestDto
    ) {
        postService.create(postRequestDto, ObjectType.COMMUNITY, communityId);
        return "redirect:/community/{communityId}";
    }

}
