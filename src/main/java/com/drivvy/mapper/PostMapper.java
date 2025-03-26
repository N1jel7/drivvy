package com.drivvy.mapper;

import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.Comment;
import com.drivvy.model.Post;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Mapper(componentModel = "spring", uses = ImageMapper.class)
public abstract class PostMapper {

    @Autowired
    UserMapper userMapper;

    @Mapping(target = "usersLiked", source = "usersLikes", qualifiedByName = "getUsersLiked")
    @Mapping(target = "likesAmount", source = "usersLikes", qualifiedByName = "getLikesAmount")
    @Mapping(target = "commentsAmount", source = "comments", qualifiedByName = "getCommentsAmount")
    public abstract PostResponseDto mapToResponse(Post post);

    public abstract List<PostResponseDto> mapToResponse(List<Post> posts);

    public abstract Post mapRequestToEntity(PostRequestDto postRequestDto);

    public abstract List<Post> mapRequestToEntity(List<PostRequestDto> postRequestDtos);

    @Named("getUsersLiked")
    public List<UserResponseDto> getUsersLiked(List<User> users) {
        return userMapper.mapToResponse(users);
    }

    @Named("getCommentsAmount")
    public Integer getCommentsAmount(List<Comment> comments) {
        return comments.size();
    }

    @Named("getLikesAmount")
    public Integer getLikesAmount(List<User> users) {
        return users.size();
    }

}
