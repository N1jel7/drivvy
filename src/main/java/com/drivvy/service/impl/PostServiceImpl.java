package com.drivvy.service.impl;

import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.exception.PostNotFoundException;
import com.drivvy.mapper.PostMapper;
import com.drivvy.model.*;
import com.drivvy.repository.PostRepository;
import com.drivvy.service.api.PostService;
import com.drivvy.util.ImageUtils;
import lombok.RequiredArgsConstructor;
import org.mapstruct.factory.Mappers;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final PostMapper postMapper;

    public PostResponseDto getPostDtoById(Long id) {
        Optional<Post> optionalPost = postRepository.findById(id);
        return postMapper.mapToResponse(optionalPost.orElseThrow(
                () -> new PostNotFoundException("Post not found"))
        );
    }

    @Override
    public Community addPostToCommunity(Community community, PostRequestDto postRequestDto) {
        return null;
    }

    @Override
    public User addPostToUser(User user, PostRequestDto postRequestDto) {
        return null;
    }

    @Override
    public Car addPostToCar(Car car, PostRequestDto postRequestDto) {
        return null;
    }

    @Override
    public Long countPostsByCommunityId(Long communityId) {
        return postRepository.countPostsByCommunityId(communityId);
    }
}
