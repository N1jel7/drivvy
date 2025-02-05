package com.drivvy.dto.response;

import com.drivvy.model.Image;
import com.drivvy.model.User;

import java.util.List;

public record PostResponseDto(
        Long id,
        String description,
        List<User> usersLikes,
        List<ImageResponseDto> images
) {
}
