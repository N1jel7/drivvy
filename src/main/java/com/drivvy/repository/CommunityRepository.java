package com.drivvy.repository;

import com.drivvy.model.Community;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface CommunityRepository extends JpaRepository<Community, Long> {
    List<Community> findCommunitiesByMembers_Id(Long memberId);
    @Query(value = "SELECT count(1) from community_members WHERE community_id = :communityId",
            nativeQuery = true)
    Long countMembersByCommunityId(Long communityId);

    @Query(value = "SELECT if(count(*)>0,'true','false') from community_members WHERE community_id = :communityId AND member_id = :userId",
            nativeQuery = true)
    boolean isItMember(Long communityId, Long userId);

    @Query(value = "SELECT if(count(*)>0,'true','false') from communities WHERE id = :communityId AND creator_id = :userId",
            nativeQuery = true)
    boolean isItCreator(Long communityId, Long userId);

    @Query(value = "SELECT * from community WHERE users = :communityId AND member_id = :userId",
            nativeQuery = true)
    boolean getUserCommunities(Long userId);
}
