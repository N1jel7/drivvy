package com.drivvy.mapper;

import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.ArrayList;
import java.util.List;

@Mapper(
        componentModel = "spring",
        uses = ImageMapper.class
)
public interface UserMapper {

    UserResponseDto mapToResponse(User user);

    List<UserResponseDto> mapToResponse(List<User> users);

}
