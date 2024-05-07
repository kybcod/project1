package com.project1.service;

import com.project1.domain.CustomUser;
import com.project1.domain.Member;
import com.project1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = mapper.selectByEmail(username);
        List<String> authority = mapper.selectAuthorityByMemberId(member.getId());
        member.setAuthority(authority);
        return new CustomUser(member);
    }
}
