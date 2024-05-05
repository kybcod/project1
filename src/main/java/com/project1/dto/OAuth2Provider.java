package com.project1.dto;

public enum OAuth2Provider {
    NAVER,
    KAKAO;

    public static OAuth2Provider of(String provider) {
        if (provider.equalsIgnoreCase(NAVER.name())) {
            return NAVER;
        } else if (provider.equalsIgnoreCase(KAKAO.name())) {
            return KAKAO;
        } else {
            throw new IllegalArgumentException("지원하지 않는 OAuth2 공급자입니다.");
        }
    }
}
