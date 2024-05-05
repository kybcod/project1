package com.project1.domain;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class Member {
    private Integer id;
    private String email;
    private String password;
    private String nickName;
    private LocalDateTime inserted;
}
