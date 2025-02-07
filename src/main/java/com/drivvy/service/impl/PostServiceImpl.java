package com.drivvy.service.impl;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.exception.ObjectTypeException;
import com.drivvy.exception.PostNotFoundException;
import com.drivvy.mapper.PostMapper;
import com.drivvy.model.*;
import com.drivvy.repository.PostRepository;
import com.drivvy.service.api.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final PostMapper postMapper;
    private final ImageServiceImpl imageService;
    private final UserServiceImpl userService;
    private final CarServiceImpl carService;
    private final CommunityServiceImpl communityService;

    public PostResponseDto getPostDtoById(Long id) {
        Optional<Post> optionalPost = postRepository.findById(id);
        return postMapper.mapToResponse(optionalPost.orElseThrow(
                () -> new PostNotFoundException("Post not found"))
        );
    }


    @Override
    public void create(PostRequestDto postRequestDto, List<MultipartFile> filesImages, ObjectType type, Long ownerId) {
        log.info("Trying to create post");
        Post post = postMapper.mapRequestToEntity(postRequestDto);
        boolean valid = imageService.validateFilesOnCreate(filesImages);
        if(valid) {
            post.setImages(imageService.filesToImages(filesImages));

            switch (type) {
                case USER:
                    post.setOwner(userService.getUserById(ownerId));
                    break;

                case CAR:
                    post.setCar(carService.getCarById(ownerId));
                    break;

                case COMMUNITY:
                    post.setCommunity(communityService.getCommunityById(ownerId));
                    break;

                default:
                    throw new ObjectTypeException("Object with type = '" + type + "' not exists");
            }
            postRepository.save(post);
            log.info("Post successfully created");
        }
    }


    @Override
    public Long countPostsByCommunityId(Long communityId) {
        return postRepository.countPostsByCommunityId(communityId);
    }
}