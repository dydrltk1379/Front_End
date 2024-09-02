package com.multi.mvc.security.filter;


import com.multi.mvc.security.util.JwtProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


// JWT 인증용 필터 (사용자 필터)
// 사용자 요청에서 토큰을 해석하고, 올바른 토큰일 경우 Spring security authentication을 수행한다.
@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private JwtProvider jwtProvider;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        // request에서 JWT 값을 확인하고, 인증 정보가 올바른 경우 인증값(authentication)을 가져오는 코드
//        try {
        Authentication authentication = jwtProvider.getAuthentication(request);
        // JWT로 인증된 정보가 있고, 올바른 토큰인 경우
        if(authentication != null & jwtProvider.isTokenValid(request)){
            // Spring Security context에 인증된 사용자 추가하는 코드 authentication
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }else {
            SecurityContextHolder.clearContext();
        }
//        } catch (Exception e){}


        // 다음 필터로 이동
        filterChain.doFilter(request, response);
    }
}