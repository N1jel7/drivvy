package com.drivvy.mapper;

import com.drivvy.dto.response.ImageResponseDto;
import com.drivvy.model.Image;
import org.mapstruct.Mapper;

import java.util.Base64;
import java.util.List;

@Mapper(componentModel = "spring")
public interface ImageMapper {

    ImageResponseDto mapToResponse(Image image);

    List<ImageResponseDto> mapToResponse(List<Image> image);

    default String toEncodedString(byte[] image) {
        return Base64.getEncoder().encodeToString(image);
    }

    default String toEncodedImage(Image image) {
        return Base64.getEncoder().encodeToString(image.getImage());
    }
}
