package com.project1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    private Integer id;
    private String title;
    private String content;
    private String writer; //작성자 nickName 용으로 사용
    private LocalDateTime inserted;
    private Integer memberId;
}
