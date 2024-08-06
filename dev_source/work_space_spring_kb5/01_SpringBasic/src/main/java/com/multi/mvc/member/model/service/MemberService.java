package com.multi.basic.member.model.service;

import java.util.List;

import com.multi.basic.member.model.dto.MemberDTO;

public interface MemberService {
	// 회원가입
	int memberEnroll(MemberDTO memberDTO);
	
	// 전체 멤버 가져오기
	List<MemberDTO> getAllList();
	
	// 로그인 기능
	MemberDTO login(String id);
}
