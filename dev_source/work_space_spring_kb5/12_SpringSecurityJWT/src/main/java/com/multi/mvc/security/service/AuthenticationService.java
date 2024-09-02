package com.multi.mvc.security.service;

import com.multi.mvc.security.model.vo.Member;
import com.multi.mvc.security.util.JwtProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtProvider jwtProvider;

    // 사용자 ID와 패스워드를 통해 로그인 후 토큰을 만들어 리턴하는 메소드
    public Member signInAndReturnJWT(Member member) throws Exception{
        //스프링 시큐리티에서 로그인하기
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(member.getUsername(),member.getPassword())
        );
        Member userPrinciple = (Member) authentication.getPrincipal();
        if(userPrinciple == null){
            return null;
        }
        String jwt = jwtProvider.generateToken(userPrinciple);// 로그인 된 유저 정보로 jwt 토큰 만들기
        //유저 정보에 토큰을 추가해서 리턴한다.
        userPrinciple.setToken(jwt);
        return userPrinciple;
    }
}
