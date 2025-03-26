package com.drivvy.mapper;

import com.drivvy.dto.request.CommentRequestDto;
import com.drivvy.dto.response.CommentResponseDto;
import com.drivvy.model.Comment;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(
        componentModel = "spring",
        uses = UserMapper.class
)
public interface CommentMapper {

    CommentResponseDto mapToResponse(Comment comment);

    List<CommentResponseDto> mapToResponse(List<Comment> comments);

    Comment mapRequestToEntity(CommentRequestDto commentRequestDto);

    List<Comment> mapRequestToEntity(List<CommentRequestDto> commentRequestDtos);


}
