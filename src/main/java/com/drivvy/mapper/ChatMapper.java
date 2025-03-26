package com.drivvy.mapper;

import com.drivvy.auth.AuthUtil;
import com.drivvy.dto.response.ChatResponseDto;
import com.drivvy.dto.response.UserResponseDto;
import com.drivvy.model.Chat;
import com.drivvy.model.Message;
import com.drivvy.model.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Mapper(
        componentModel = "spring",
        uses = MessageMapper.class
)
public abstract class ChatMapper {
    @Autowired
    private UserMapper userMapper;

    @Mapping(target = "lastMessage", source = "messages", qualifiedByName = "getLastMessage")
    @Mapping(target = "companion", source = "users", qualifiedByName = "getCompanion")
    public abstract ChatResponseDto mapToResponse(Chat chat);

    public abstract List<ChatResponseDto> mapToResponse(List<Chat> chat);

    @Named("getLastMessage")
    public Message getLastMessage(List<Message> messages) {
        if(messages != null && !messages.isEmpty()) {
            return messages.getLast();
        }
        return null;
    }

    @Named("getCompanion")
    public UserResponseDto getCompanion(List<User> users) {
        User companion = null;
        for (User user : users) {

            if (user.getUsername().equals(AuthUtil.getCurrentUser().getUsername())) {
                companion = user;
            }
        }
        return userMapper.mapToResponse(companion);
    }

}
