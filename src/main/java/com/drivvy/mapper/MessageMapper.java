package com.drivvy.mapper;

import com.drivvy.dto.response.MessageResponseDto;
import com.drivvy.model.Message;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Mapper(componentModel = "spring")
public interface MessageMapper {

    @Mapping(target = "author", source = "sender", qualifiedByName = "authorToString")
    @Mapping(target = "createdAt", source = "createdAt", qualifiedByName = "createdAtToString")
    MessageResponseDto mapToResponse(Message message);

    List<MessageResponseDto> mapToResponse(List<Message> messages);

    @Named("authorToString")
    default String authorToString(User sender) {
        return sender.getUsername();
    }

    @Named("createdAtToString")
    default String createdAtToString(LocalDateTime createdAt) {
        return createdAt.format(DateTimeFormatter.ofPattern("HH:mm"));
    }
}
