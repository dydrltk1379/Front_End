package com.multi.mvc.security.util;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

public class JwtUtils {
    public static final String ROLE_PREFIX = "ROLE_";

    // header에서 Token 값을 가져오는데 필요한 값들
    public static final String AUTH_HEADER = "authorization";
    public static final String AUTH_TOKEN_TYPE = "Bearer";
    public static final String AUTH_TOKEN_PREFIX = AUTH_TOKEN_TYPE + " "; // 한 칸 띄우는것을 넣어줘야함


    //시큐리티에서 "ROLE_ADMIN" ,"ROLE_USER"로 설정하기 때문에 앞에 "ROLE"을 붙여줌
    public static SimpleGrantedAuthority convertToAuthority(String role) {
        String formattedRole = role.startsWith(ROLE_PREFIX) ? role : ROLE_PREFIX + role;
        return new SimpleGrantedAuthority(formattedRole);
    }

    //Header 항목 중 토큰이 있으면 실제 토큰만 잘라서 리턴 또는 없을 경우 null리턴
    public static String extractAuthTokenFromRequest(HttpServletRequest request) { //요청 값을 가져온다.

        String bearerToken = request.getHeader(AUTH_HEADER);//Http 헤더의 항목 중 authorization을 찾는다.

        //토큰이 있고, 토큰이 AUTH_TOKEN_PREFIX(Bearer " ")으로 시작하는지 확인한다.
        if (StringUtils.hasLength(bearerToken) && bearerToken.startsWith(AUTH_TOKEN_PREFIX)) {
            //토큰 시작 부분으로부터 7자리까지 잘라서 리턴한다.
            return bearerToken.substring(7); //토큰 부분만 잘라서 리턴
        }
        return null; // 토큰이 없을경우
    }
}