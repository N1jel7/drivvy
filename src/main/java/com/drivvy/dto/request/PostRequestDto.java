package com.drivvy.dto.request;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public record PostRequestDto(
        String title,
        String description,
        List<MultipartFile> filesImages,
        MultipartFile previewImage
) {
}
