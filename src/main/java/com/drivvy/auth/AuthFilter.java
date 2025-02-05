package com.drivvy.auth;

import com.drivvy.dto.session.UserDto;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Slf4j
@Component
public class AuthFilter implements Filter {
    private static final String USER_PRINCIPAL_KEY = "userDto";

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        AuthUtil.setCurrentUser((UserDto) httpServletRequest.getSession().getAttribute(USER_PRINCIPAL_KEY));
        filterChain.doFilter(servletRequest, servletResponse);
    }
}
