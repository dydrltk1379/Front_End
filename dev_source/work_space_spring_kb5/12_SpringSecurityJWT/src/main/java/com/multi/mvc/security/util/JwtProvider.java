package com.multi.mvc.security.util;

import com.multi.mvc.security.model.vo.Member;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

// JWT 토큰을 생성하는 생성자
@Service
@PropertySource("classpath:jwt.properties")
public class JwtProvider {

    // JWT 비밀키
    @Value("${jwt.secret}")
    private String JWT_SECRET;

    // JWT 인증 기간
    @Value("${jwt.expiration-in-ms}")
    private Long JWT_EXPIRATION_IN_MS;

    // member를 기준으로 JWT 토큰을 만드는 메소드
    public String generateToken(Member member) {

        String authorites = member.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));

        Key key = Keys.hmacShaKeyFor(JWT_SECRET.getBytes(StandardCharsets.UTF_8));

        return Jwts.builder() // 토큰은 문자열로 리턴됨
                .subject(member.getUsername())
                .claim("roles", authorites)
                .claim("userId", member.getId())
                .expiration(new Date(System.currentTimeMillis() + JWT_EXPIRATION_IN_MS))// 시간 : 현재 시간에서 하루 유지
                .signWith(key, SignatureAlgorithm.HS512) //암호화 된 키
                .compact();
    }

    // JwtProviderImpl 리퀘스트의 토큰에서 암호풀어 Claims 가져오는 메소드
    // 토큰에서 유저 정보 CLAIM 부분만 가져옴
    public Claims extracClaims(HttpServletRequest request) {
        //리퀘스트 헤더에서 토큰만 가져옴
        String token = JwtUtils.extractAuthTokenFromRequest(request);
        //만약 토큰이 없다면  null을 리턴한다.
        if (token == null) return null;
        //시크릿 키 암호를 풀기 (hmacShaKeyFor를 사용)
        Key key = Keys.hmacShaKeyFor(JWT_SECRET.getBytes(StandardCharsets.UTF_8));

        //유저의 정보 부분을 리턴한다.
        return Jwts.parser()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }


    // JWT 토큰 기반으로 Spring 시큐리티 Authentication을 가져오는 메소드
    public Authentication getAuthentication(HttpServletRequest request) {
        // Claims = JWT 인증 정보
        Claims claims = extracClaims(request);
        // 인증정보 없으면 null 리턴
        if (claims == null) {
            return null;
        }

        // 인증된 ID(username) 가져오기
        String username = claims.getSubject();

        // 인증된 권한 가져오기
        List<GrantedAuthority> authorities = Arrays.stream(claims.get("roles").toString().split(","))
                .map(JwtUtils::convertToAuthority)
                .collect(Collectors.toList());
        
        // Spring security UserDetails에 새로운 인증 정보 등록하기
        UserDetails userDetails = Member.builder()
                .id((username))
                .authorities(authorities)
                .build();

        if (username == null) {
            return null;
        }
        return new UsernamePasswordAuthenticationToken(userDetails, null, authorities);
    }

    // 토큰과 올바른지 확인하는 메소드
    // 토큰 값과 발행 시간을 기준으로 확인
    public boolean isTokenValid(HttpServletRequest request) {
        Claims claims = extracClaims(request);
        if(claims == null) {
            return false;
        }
        return !claims.getExpiration().before(new Date());
    }

}
