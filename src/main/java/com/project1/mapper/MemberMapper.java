package com.project1.mapper;

import com.project1.domain.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member (email, password, nick_name) VALUES (#{email}, #{password}, #{nickName})
            """)
    void insert(Member member);

    @Select("SELECT * FROM member WHERE id = #{id}")
    Member selectById(Integer id);

    @Select("SELECT * FROM member ORDER BY id DESC ")
    List<Member> selectAll();

    @Delete("DELETE FROM member WHERE id = #{id}")
    int delete(Integer id);

    @Update("""
            UPDATE member SET password = #{password}, nick_name = #{nickName} WHERE id = #{id}
            """)
    int update(Member member);

    @Select("SELECT * FROM member WHERE email = #{email}")
    Member selectByEmail(String email);
}
