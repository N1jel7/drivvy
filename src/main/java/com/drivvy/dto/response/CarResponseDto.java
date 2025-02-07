package com.drivvy.dto.response;

import com.drivvy.model.Image;

import java.util.List;

public record CarResponseDto(
        Long id,
        String make,
        String model,
        Integer year,
        String engineVolume,
        String engineType,
        Integer mileage,
        String description,
        Long ownerId,
        String preview,
        List<Image> images
) {
}
