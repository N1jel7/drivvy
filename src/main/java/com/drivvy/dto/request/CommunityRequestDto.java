package com.drivvy.dto.request;

import com.drivvy.dto.common.AccessModifier;

public record CommunityRequestDto(
        String name,
        String description,
        String avatar,
        String country,
        AccessModifier accessModifier
) {
}
