package com.drivvy.mapper;

import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.model.Post;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.util.List;

@Mapper(componentModel = "spring", uses = ImageMapper.class)
public interface PostMapper {

    @Mapping(target = "likesAmount", source = "usersLikes", qualifiedByName = "getLikesAmount")
    PostResponseDto mapToResponse(Post post);

    List<PostResponseDto> mapToResponse(List<Post> posts);

    Post mapRequestToEntity(PostRequestDto postRequestDto);

    List<Post> mapRequestToEntity(List<PostRequestDto> postRequestDtos);

    @Named("getLikesAmount")
    default Integer getLikesAmount(List<User> users) {
        return users.size();
    }

}
