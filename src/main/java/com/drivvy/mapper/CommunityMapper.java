package com.drivvy.mapper;

import com.drivvy.dto.response.CommunityResponseDto;
import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.Community;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Mapper(
        componentModel = "spring",
        uses = {
                ImageMapper.class,
                UserMapper.class
        }
)
public abstract class CommunityMapper {

    @Autowired
    UserMapper userMapper;

    @Mapping(target = "overviewMembers", source = "community.members", qualifiedByName = "getOverviewMembers")
    public abstract CommunityResponseDto mapToResponse(Community community, Long membersAmount, Long postsAmount);

    public abstract List<CommunityResponseDto> mapToResponse(List<Community> communities);

    @Named("getOverviewMembers")
    public List<UserResponseDto> toOverview(List<User> members) {
        List<UserResponseDto> usersResponseDtos = new ArrayList<>();
        int size = 0;

        if(members.size() < 6) {
            size = members.size();
        }

        for (int i = 0; i < size; i++) {
            usersResponseDtos.add(userMapper.mapToResponse(members.get(i)));
        }

        return usersResponseDtos;
    }
}
