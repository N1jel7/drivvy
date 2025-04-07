package com.drivvy.mapper;

import com.drivvy.dto.response.CarResponseDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.model.Car;
import com.drivvy.model.Image;
import com.drivvy.model.Post;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Mapper(
        componentModel = "spring",
        uses = ImageMapper.class
)
public abstract class CarMapper {

    @Autowired
    private PostMapper postMapper;

    @Mapping(target = "posts", source = "posts", qualifiedByName = "getPosts")
    @Mapping(target = "createdAt", source = "car.createdAt")
    @Mapping(target = "preview", source = "car.images", qualifiedByName = "getPreviewImage")
    @Mapping(target = "ownerId", source = "car.owner", qualifiedByName = "getOwnerId")
    @Mapping(target = "postsAmount", source = "posts", qualifiedByName = "getPostsAmount")
    @Mapping(target = "usersLikes", source = "car.usersLikes", qualifiedByName = "getUsersLikes")
    public abstract CarResponseDto mapToResponse(Car car, List<Post> posts);

    @Named("getPosts")
    public List<PostResponseDto> getPosts(List<Post> posts) {
        return postMapper.mapToResponse(posts);
    }

    @Named("getUsersLikes")
    public Integer getUsersLikes(List<User> usersLikes) {
        return usersLikes.size();
    }

    @Named("getPostsAmount")
    public Integer getPostsAmount(List<Post> posts) {
        return posts.size();
    }

    @Named("getOwnerId")
    public Long getOwnerId(User owner) {
        return owner.getId();
    }

    @Named("getPreviewImage")
    public Image toPreview(List<Image> images) {
        return images.stream()
                .filter(Image::isPreview)
                .findFirst()
                .orElse(null);
    }
}
