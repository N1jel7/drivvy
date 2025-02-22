package com.drivvy.dto.response;

import com.drivvy.model.Image;
import com.drivvy.model.User;

import java.time.LocalDate;
import java.util.List;

public record PostResponseDto(
        Long id,
        String description,
        List<UserResponseDto> usersLiked,
        Integer likesAmount,
        LocalDate createdAt,
        List<ImageResponseDto> images
) {
}
