package com.drivvy.dto.response;

public record ProfileInfoResponse(
        Integer followers,
        Integer posts,
        Integer following
) {
}
