package com.drivvy.service.api;

import com.drivvy.dto.request.CommunityRequestDto;
import com.drivvy.dto.response.CommunityResponseDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CommunityService {

    List<CommunityResponseDto> getAllGroups();

    CommunityResponseDto getCommunityDtoById(Long id);

    CommunityResponseDto create(CommunityRequestDto communityRequestDto, MultipartFile avatarFile, Long creatorId);

    void removeUserFromCommunity(Long communityId, Long userId);

    boolean joinUserToCommunity(Long communityId, Long userId);
}