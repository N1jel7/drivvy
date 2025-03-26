package com.drivvy.service.impl;

import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.dto.request.UpdateUserInfoRequestDto;
import com.drivvy.dto.response.CommunityResponseDto;
import com.drivvy.dto.response.ProfileInfoResponse;
import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.dto.session.UserDto;
import com.drivvy.exception.UserNotFoundException;
import com.drivvy.mapper.UserMapper;
import com.drivvy.model.Community;
import com.drivvy.model.Post;
import com.drivvy.model.User;
import com.drivvy.repository.PostRepository;
import com.drivvy.repository.UserRepository;
import com.drivvy.service.api.UserService;
import com.drivvy.util.ImageUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PostRepository postRepository;
    private final UserMapper userMapper;


    public ProfileInfoResponse getProfileInfo(Long userId) {
        Integer posts = Math.toIntExact(postRepository.countPostsByUserId(userId));
        return new ProfileInfoResponse(0, posts,0);
    }

    public Long getUserId(String username) {
        Optional<Long> optionalId = Optional.ofNullable(userRepository.findByUsername(username).getId());
        return optionalId.orElseThrow(
                () -> new UserNotFoundException("User with username '" + username + "' not found")
        );
    }

    @Override
    public UserResponseDto saveUser(User user) {
        User savedUser = userRepository.save(user);
        return userMapper.mapToResponse(savedUser);
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public UserDto getUserDtoByUsername(String username) {
        User user = getUserByUsername(username);
        return new UserDto(user.getId(),
                user.getUsername(),
                ImageUtils.encode(user.getAvatar().getImage()),
                user.getCountry());
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new UserNotFoundException("User not found"));
    }

    public UserResponseDto getUserDtoById(Long id) {
        return userMapper.mapToResponse(getUserById(id));
    }


    public UserResponseDto updateUserData(MultipartFile avatarFile, Long userId, UpdateUserInfoRequestDto updateRequest) {
        User userDb = getUserById(userId);
        return setData(userDb, updateRequest, avatarFile);
    }

    private UserResponseDto setData(User userDb, UpdateUserInfoRequestDto updateRequest, MultipartFile avatar) {
        userDb.setFirstname(updateRequest.firstname().isEmpty() ? userDb.getFirstname() : updateRequest.firstname());
        userDb.setLastname(updateRequest.lastname().isEmpty() ? userDb.getLastname() : updateRequest.lastname());
        userDb.setCountry(updateRequest.country().isEmpty() ? userDb.getCountry() : updateRequest.country());
        userDb.setCity(updateRequest.city().isEmpty() ? userDb.getCity() : updateRequest.city());
        userDb.setGender(updateRequest.gender() == null ? userDb.getGender() : updateRequest.gender());
        userDb.setBirthday(updateRequest.birthday() == null ? userDb.getBirthday() : updateRequest.birthday());

        return saveUser(userDb);
    }


}
