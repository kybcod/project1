package com.project1.config;

import com.project1.domain.Member;
import com.project1.dto.NaverMemberInfo;
import com.project1.dto.OAuth2MemberInfo;
import com.project1.dto.OAuth2Provider;
import com.project1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class OAuth2UserService extends DefaultOAuth2UserService {

    private final MemberMapper memberMapper;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) {
        log.trace("Load user {}", oAuth2UserRequest);
        OAuth2User oAuth2User = super.loadUser(oAuth2UserRequest);
        return processOAuth2User(oAuth2UserRequest, oAuth2User);
    }

    private OAuth2User processOAuth2User(OAuth2UserRequest oAuth2UserRequest, OAuth2User oAuth2User) {
        System.out.println("getClientRegistration : " + oAuth2UserRequest.getClientRegistration());
        System.out.println("getAccessToken : " + oAuth2UserRequest.getAccessToken().getTokenValue());
        System.out.println("getAttributes : " + oAuth2User.getAttributes());
        String registrationId = oAuth2UserRequest.getClientRegistration().getRegistrationId();

        OAuth2MemberInfo response = null;
        if (OAuth2Provider.of(registrationId) == OAuth2Provider.NAVER) {
            response = new NaverMemberInfo((Map) oAuth2User.getAttributes().get("response"));
        }

        Member userInfoDto = Member
                .builder()
                .email(response.getEmail())
                .nickName(response.getNickname())
                .password(oAuth2UserRequest.getAccessToken().getTokenValue())
                .build();

        Member member = memberMapper.selectByEmail(userInfoDto.getEmail());
        if (member == null) {
            memberMapper.insert(member);
        }
        return new PrincipalDetails(member, oAuth2User.getAttributes());
    }
}
