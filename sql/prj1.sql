CREATE DATABASE prj1;
USE prj1;

DROP TABLE board;
CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    writer   VARCHAR(100)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

SELECT *
FROM board;

# 회원 테이블
CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(100) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);

SELECT *
FROM member;

# 페이지용 게시물  복사
INSERT INTO board (title, content, writer)
SELECT title, content, writer
FROM board;

ALTER TABLE board
    DROP COLUMN writer;
ALTER TABLE board
    ADD COLUMN member_id INT REFERENCES member (id);

UPDATE board
SET member_id = 39
WHERE id > 0;

SELECT *
FROM board;

# 권한 테이블 만들기
CREATE TABLE authority
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT         NOT NULL REFERENCES member (id),
    name      VARCHAR(20) NOT NULL
);

INSERT INTO authority (member_id, name)
VALUES (47, 'admin');

SELECT *
FROM authority;

SELECT *
FROM member m
         LEFT JOIN authority a on m.id = a.member_id;