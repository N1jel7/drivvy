package com.drivvy.service.impl;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.CommentRequestDto;
import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.response.PostResponseDto;
import com.drivvy.exception.ObjectTypeException;
import com.drivvy.exception.PostNotFoundException;
import com.drivvy.mapper.CommentMapper;
import com.drivvy.mapper.PostMapper;
import com.drivvy.model.Post;
import com.drivvy.model.User;
import com.drivvy.repository.PostRepository;
import com.drivvy.service.api.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final PostMapper postMapper;
    private final CommentMapper commentMapper;
    private final ImageServiceImpl imageService;
    private final UserServiceImpl userService;
    private final CarServiceImpl carService;
    private final CommunityServiceImpl communityService;

    @Override
    public void create(PostRequestDto postRequestDto, List<MultipartFile> filesImages, ObjectType type, Long ownerId) {
        log.info("Trying to create post");
        Post post = postMapper.mapRequestToEntity(postRequestDto);
        boolean valid = imageService.validateFilesOnCreate(filesImages);
        if (valid) {
            post.setImages(imageService.filesToImages(filesImages));
        }

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

    public List<PostResponseDto> getPostByObjectId(Long objectId, ObjectType type) {
        List<Post> posts = new ArrayList<>();
        switch (type) {
            case USER:
                posts.addAll(postRepository.findAllByOwner_Id(objectId));
                break;
            case CAR:
                posts.addAll(postRepository.findAllByCar_Id(objectId));
                break;

            case COMMUNITY:
                posts.addAll(postRepository.findAllByCommunity_Id(objectId));
                break;

            default:
                throw new ObjectTypeException("Object with type = '" + type + "' not exists");
        }
        return postMapper.mapToResponse(posts.reversed());
    }

    public boolean likeOrDislikePost(Long userId, Long postId) {
        Post post = getPostById(postId);
        User user = userService.getUserById(userId);

        if (post.getUsersLikes().contains(user)) {
            post.getUsersLikes().remove(user);
            postRepository.save(post);
            return false;
        } else {
            post.getUsersLikes().add(user);
            postRepository.save(post);
            return true;
        }
    }

    public void deletePost(Long postId) {
        postRepository.deleteById(postId);
        log.info("Post id={} successfully deleted", postId);
    }

    public void editPost(PostRequestDto postRequestDto, Long postId) {
        Post post = getPostById(postId);

        if(postRequestDto.description() != null) {
            post.setDescription(postRequestDto.description());
        }

        postRepository.save(post);
    }

    public void addCommentToPost(CommentRequestDto commentRequestDto) {
        log.info("Adding comment to the post with id={}", commentRequestDto.postId());
        Post post = getPostById(commentRequestDto.postId());
        User author = userService.getUserById(commentRequestDto.authorId());

        post.getComments().add(commentMapper.mapRequestToEntity(commentRequestDto));
        post.getComments().getLast().setAuthor(author);
        postRepository.save(post);
        log.info("Comment successfully added to post id={}", commentRequestDto.postId());
    }

    private Post getPostById(Long id) {
        return postRepository.findById(id).orElseThrow(() -> new PostNotFoundException("Post not found"));
    }

    public PostResponseDto getPostDtoById(Long id) {
        Optional<Post> optionalPost = postRepository.findById(id);
        return postMapper.mapToResponse(optionalPost.orElseThrow(
                () -> new PostNotFoundException("Post not found"))
        );
    }

    @Override
    public Long countPostsByCommunityId(Long communityId) {
        return postRepository.countPostsByCommunityId(communityId);
    }

    public Long countPostsByUserId(Long userId) {
        return postRepository.countPostsByUserId(userId);
    }
}