package com.multi.mvc.member.controller;

import com.multi.mvc.member.service.MemberService;
import com.multi.mvc.security.model.vo.Member;
import com.multi.mvc.security.service.AuthenticationService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@Api(value = "MemberController", tags = "로그인 정보")
public class MemberController {

    @Autowired
    MemberService memberService;

    @Autowired
    AuthenticationService authenticationService;

    //로그인
    @PostMapping("/member/login")
    public ResponseEntity<Object> login(@RequestBody Member member){
        //인증 완료 시 jwt 토큰이 리턴됨 상태는 ok
        Member result = null;
        try {
            result = authenticationService.signInAndReturnJWT(member);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        if(result != null){
            return new ResponseEntity<>(result, HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    // 로그 아웃
    @GetMapping("/member/logout")
    public ResponseEntity<Object> logout(Authentication authentication){
        SecurityContextHolder.clearContext();
        Map<String,String> map = new HashMap<>();
        map.put("result", "ok");
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
}
