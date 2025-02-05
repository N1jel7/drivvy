package com.drivvy.mapper;

import com.drivvy.dto.response.CarResponseDto;
import com.drivvy.model.Car;
import com.drivvy.model.Image;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(
        componentModel = "spring",
        uses = ImageMapper.class
)
public interface CarMapper {
    @Mapping(target = "preview", source = "images")
    @Mapping(target = "ownerId", source = "owner", qualifiedByName = "getOwnerId")
    CarResponseDto mapToResponse(Car car);

    List<CarResponseDto> mapToResponse(List<Car> cars);

    @Named("getOwnerId")
    default Long getOwnerId(User owner) {
        return owner.getId();
    }

    default Image toPreview(List<Image> images) {
        return images.stream()
                .filter(Image::isPreview)
                .findFirst()
                .orElse(null);
    }
}
