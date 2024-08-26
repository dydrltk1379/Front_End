package com.multi.aop.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.multi.aop.model.vo.Member;
import com.multi.aop.service.MemberService;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	
	@RequestMapping("/loginPage.do")
	public String loginPage() {
		return "member/login"; // /webapp/WEB-INF/views/member/login.jsp
	}
	
	
	@RequestMapping("/login.do")
//	public String login(Model model, String id, String pw, HttpSession session) throws IllegalAccessException {
	public String login(Model model, Member member, HttpSession session) throws IllegalAccessException {
		Member loginMember = service.selectById(member);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			return "member/loginSuccess";
		} else {
			return "member/loginFailed";
		}
	}
	
	@RequestMapping("/joinPage.do")
	public String joinPage() {
		return "member/join";
	}
	
	
	@RequestMapping("/join.do")
	public String join(Model model, Member member) {
        int result = 0;
        try {
            result = service.insertMember(member);
        } catch (IllegalAccessException e) {
			log.info("회원가입 실패!");
		}

        if(result > 0) {
			return "member/joinSuccess";  
		}else {
			return "member/joinFailed";  
		}
	}
	
	// AJAX 설계 코드
	@ResponseBody // return 될 값이 view의 이름이 아닌 몸통일때 사용
	@RequestMapping(value="/checkId.do", produces = "text/html; charset=utf-8") // media type, JSON이 아닌 일반 문자열일때
	public String checkId(Member member) throws IllegalAccessException {
		Member checkMember = service.selectById(member);
		if(checkMember != null) {
			return "1"; // 1은 중복
		}else {
			return "0"; // 0은 비었을때
		}
	}
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
//		List<Member> list = service.selectAll();
//		model.addAttribute("list", list);
		// AJAX로 List 다시 넘길 예정
		return "member/list";
	}
	
	// AJAX 설계 코드
	@ResponseBody // xml, json, html 모두 만들어서 리턴 가능!
	@RequestMapping(value="/memberAllList.do", produces = "application/json; charset=utf-8") // media type, JSON일 때
	public String memberAllList() {
		List<Member> list = service.selectAll();
		return new Gson().toJson(list);
	}


	@RequestMapping("/makeInsertError.do")
	public String makeInsertError(Model model) throws IllegalAccessException {
		Member member = new Member();
		member.setId("test" + new Random().nextInt());
		member.setPw("1234");
		member.setName("박길동");

		int result = service.insertMemberForError(member);

		if(result > 0) {
			return "member/joinSuccess";
		}else {
			return "member/joinFailed";
		}
	}

	@RequestMapping("/makeInsertError2.do")
	public String makeInsertError2(Model model) throws IllegalAccessException {
		Member member = new Member();
		member.setId("test" + + new Random().nextInt());
		member.setPw("4321");
		member.setName("이길동");

		int result = service.insertMemberForErrorCheck(member);

		if(result > 0) {
			return "member/joinSuccess";
		}else {
			return "member/joinFailed";
		}
	}

	// 에러 처리하는 곳
	@RequestMapping("/error.do")
	public String error() {
		return "common/error";
	}

	// 메소드에서 에러 발생한 경우 공통으로 처리하는 코드부
	@ExceptionHandler(RuntimeException.class)
	public String errorHandler() {
		return "redirect:error.do";
	}
}






