package com.project1.dto;

public interface OAuth2MemberInfo {
    OAuth2Provider getProvider(); //공급자 ex) google, facebook

    String getEmail(); //사용자 이메일 ex) gildong@gmail.com

    String getNickname();
}
