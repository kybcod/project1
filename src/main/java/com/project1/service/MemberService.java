package com.project1.service;

import com.project1.domain.Member;
import com.project1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class MemberService {

    private final MemberMapper mapper;

    public void signup(Member member) {
        mapper.insert(member);
    }

    public Member selectAll(Integer id) {
        return mapper.selectById(id);
    }

    public List<Member> list() {
        return mapper.selectAll();
    }
}

