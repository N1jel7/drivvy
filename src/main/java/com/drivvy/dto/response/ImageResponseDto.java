package com.drivvy.dto.response;

import jakarta.persistence.Lob;
import jakarta.persistence.Transient;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

public record ImageResponseDto(
        Long id,
        boolean preview,
        LocalDateTime createdAt,
        String image
) {
}
