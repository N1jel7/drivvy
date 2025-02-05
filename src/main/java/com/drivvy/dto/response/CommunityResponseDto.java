package com.drivvy.dto.response;

import com.drivvy.dto.common.AccessModifier;

import java.util.List;

public record CommunityResponseDto(
        Long id,
        String name,
        String description,
        String avatar,
        String country,
        AccessModifier accessModifier,
        List<UserResponseDto> overviewMembers,
        Long membersAmount,
        Long postsAmount
) {
}
