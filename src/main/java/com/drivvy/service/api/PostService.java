package com.drivvy.service.api;

import com.drivvy.dto.common.ObjectType;
import com.drivvy.dto.request.PostRequestDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PostService {

    void create(
            PostRequestDto postRequestDto,
            List<MultipartFile> filesImages,
            ObjectType type,
            Long ownerId);

    Long countPostsByCommunityId(Long communityId);
}
