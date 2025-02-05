package com.drivvy.auth;

import com.drivvy.dto.session.UserDto;

public final class AuthUtil {
    private static final ThreadLocal<UserDto> threadLocal = new ThreadLocal<>();


    private AuthUtil(){}

    public static UserDto getCurrentUser(){
        return threadLocal.get();
    }

    static void setCurrentUser(UserDto user){
        threadLocal.set(user);
    }


}
