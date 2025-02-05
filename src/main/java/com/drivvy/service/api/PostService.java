package com.drivvy.service.api;

import com.drivvy.dto.request.PostRequestDto;
import com.drivvy.model.Car;
import com.drivvy.model.Community;
import com.drivvy.model.User;

public interface PostService {

    Community addPostToCommunity(Community community, PostRequestDto postRequestDto);

    User addPostToUser(User user, PostRequestDto postRequestDto);

    Car addPostToCar(Car car, PostRequestDto postRequestDto);

    Long countPostsByCommunityId(Long communityId);
}
