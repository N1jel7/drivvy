package com.drivvy.repository;

import com.drivvy.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PostRepository extends JpaRepository <Post, Long> {

    List<Post> findAllByCommunity_Id(Long communityId);

    List<Post> findAllByOwner_Id(Long ownerId);

    List<Post> findAllByCar_Id(Long carId);

    @Query(value = "SELECT count(1) from post WHERE community_id = :communityId",
            nativeQuery = true)
    Long countPostsByCommunityId(Long communityId);

    @Query(value = "SELECT count(1) from post WHERE owner_id = :ownerId",
            nativeQuery = true)
    Long countPostsByUserId(Long ownerId);
}
