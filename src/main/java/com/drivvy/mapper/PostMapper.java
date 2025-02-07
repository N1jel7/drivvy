package com.drivvy.mapper;

import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.model.Post;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring", uses = ImageMapper.class)
public interface PostMapper {

    PostResponseDto mapToResponse(Post post);

    List<PostResponseDto> mapToResponse(List<Post> posts);

    Post mapRequestToEntity(PostRequestDto postRequestDto);

    List<Post> mapRequestToEntity(List<PostRequestDto> postRequestDtos);

}
