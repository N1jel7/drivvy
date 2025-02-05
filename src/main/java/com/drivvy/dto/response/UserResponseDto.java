package com.drivvy.dto.response;

import com.drivvy.dto.common.Gender;

import java.time.LocalDate;

public record UserResponseDto(
        Long id,
<<<<<<< Updated upstream
        String username
=======
        String username,
        String avatar,
        String email,
        String firstname,
        String lastname,
        String country,
        String city,
        Gender gender,
        LocalDate birthday
>>>>>>> Stashed changes
) {
}
