package com.drivvy.dto.request;

public record CarRequestDto(
        String make,
        String model,
        Integer year,
        Float engineVolume,
        String engineType,
        String description,
        Integer mileage
) {
}
