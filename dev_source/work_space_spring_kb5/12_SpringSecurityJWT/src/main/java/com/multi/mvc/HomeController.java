package com.multi.mvc;

import com.multi.mvc.member.service.MemberService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.keygen.KeyGenerators;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@GetMapping("/")
	public String home(Model model) {
		return "home";
	}

	// 수동 로그인 페이지
	@GetMapping("/member/memberLogin.do")
	public void memberLogin() {}

	@GetMapping("/error/accessDenied.do")
	public void accesDenied() {}

}
