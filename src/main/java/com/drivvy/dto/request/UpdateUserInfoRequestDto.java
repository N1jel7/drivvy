package com.drivvy.dto.request;

import com.drivvy.dto.common.Gender;

import java.time.LocalDate;

public record UpdateUserInfoRequestDto(
        String firstname,
        String lastname,
        String country,
        String city,
        Gender gender,
        LocalDate birthday
) {
}
