package com.drivvy.session;

import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Data
@SessionScope
@Component
public class UserInfoSession {

    private String username;
    private Long id;


}
