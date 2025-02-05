package com.drivvy.service.impl;

import com.drivvy.dto.request.CommunityRequestDto;
import com.drivvy.dto.response.CommunityResponseDto;
import com.drivvy.exception.CommunityNotFoundException;
import com.drivvy.exception.GroupNotFoundException;
import com.drivvy.mapper.CommunityMapper;
import com.drivvy.model.Community;
import com.drivvy.model.Image;
import com.drivvy.model.User;
import com.drivvy.repository.CommunityRepository;
import com.drivvy.service.api.CommunityService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommunityServiceImpl implements CommunityService {

    private final ImageServiceImpl imageService;
    private final CommunityRepository communityRepository;
    private final UserServiceImpl userService;
    private final PostServiceImpl postService;
    private final CommunityMapper communityMapper;


    public CommunityResponseDto mapToResponse(Community community) {
        CommunityResponseDto communityResponseDto = communityMapper.mapToResponse(community);
        return new CommunityResponseDto(
                communityResponseDto.id(),
                communityResponseDto.name(),
                communityResponseDto.description(),
                communityResponseDto.avatar(),
                communityResponseDto.country(),
                communityResponseDto.accessModifier(),
                communityResponseDto.overviewMembers(),
                communityRepository.countMembersByCommunityId(communityResponseDto.id()),
                postService.countPostsByCommunityId(communityResponseDto.id())
        );
    }

    public List<CommunityResponseDto> mapToResponse(List<Community> communities) {
        return communities.stream()
                .map(this::mapToResponse)
                .toList();
    }

    public boolean isUserMember(Long communityId, Long userId) {
        return communityRepository.isItMember(communityId, userId);
    }

    //TODO PAGINATION
    @Override
    public List<CommunityResponseDto> getAllGroups() {
        return mapToResponse((communityRepository.findAll()));
    }

    @Override
    public CommunityResponseDto getCommunityById(Long id) {
        return mapToResponse(communityRepository.findById(id).orElseThrow(
                () -> new GroupNotFoundException("Group with id '" + id + "' not found")
        ));
    }

    @Override
    public CommunityResponseDto create(CommunityRequestDto communityRequestDto, MultipartFile avatarFile, Long creatorId) {
        Image image = null;

        if(avatarFile.getOriginalFilename().isEmpty()) {
            image = imageService.setDefaultCommunityImage();
        }

        Community community = new Community(
                null,
                List.of(userService.getUserById(creatorId)),
                communityRequestDto.name(),
                communityRequestDto.description(),
                image,
                communityRequestDto.country(),
                communityRequestDto.accessModifier(),
                LocalDateTime.now()
        );

        log.info("User(id={}) successfully created community", creatorId);
        return mapToResponse(communityRepository.save(community));
    }

    @Override
    public void removeUserFromCommunity(Long communityId, Long userId) {
        Community community = communityRepository.findById(communityId)
                .orElseThrow(
                        () -> new CommunityNotFoundException("Community not found")
                );

        User member = userService.getUserById(userId);
        community.getMembers().remove(member);
        communityRepository.save(community);
    }

    @Override
    public boolean joinUserToCommunity(Long communityId, Long userId) {
        Community community = communityRepository.findById(communityId)
                .orElseThrow(
                        () -> new CommunityNotFoundException("Community not found")
                );
        User user = userService.getUserById(userId);

        List<User> users = community.getMembers();
        if (users.contains(user)) {
            log.warn("Can`t add user id={} to community={}. User already joined", userId, communityId);
        } else {
            users.add(user);
            log.info("User id={} joined the community id={}", userId, communityId);
        }

        communityRepository.save(community);
        return true;
    }
}
