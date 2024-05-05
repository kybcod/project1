package com.project1.dto;

import java.util.Map;

public class NaverMemberInfo implements OAuth2MemberInfo {
    public NaverMemberInfo(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    private Map<String, Object> attributes;

    @Override
    public OAuth2Provider getProvider() {
        return OAuth2Provider.NAVER;
    }

    @Override
    public String getNickname() {
        return (String) attributes.get("nickname");
    }

    @Override
    public String getEmail() {
        return (String) attributes.get("email");
    }
}
