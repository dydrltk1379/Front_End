package com.multi.aop.service;

import java.util.ArrayList;
import java.util.List;

import com.multi.aop.model.mapper.MemberMapper;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.aop.model.vo.Member;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

// AOP로 컨트롤 될 대상을 서비스에 정의할 예정
// AOP를 설계할때 Service 메소드의 파라미터는 가급적 한가지 패턴을 통해 설계하는 것이 유리하다.
// -> 이렇게 설계하지 않으면 Joinpoint를 여러개를 생성해야한다.
@Service("memberService")
//@Transactional
public class MemberService {

	@Autowired
	private MemberMapper mapper;


	// @Transactional : 스프링에서 쿼리 처리를 트랜잭션으로 처리할때 활용하는 어노테이션
	//					rollback과 commit의 기준이 된다.
	@Transactional(readOnly = true)
	public List<Member> selectAll(){
		System.out.println("selectAll Call!!");
		return mapper.selectAll();
	}

	@Transactional(readOnly = true)
	// readOnly : isolation 옵션을 적용하였을 경우 select절에서 lock 영향 받지 않는 옵션
	public Member selectById(Member m) throws IllegalAccessException {
		System.out.println("selectById Call!! Member : " + m.toString());

		if(m == null || m.getId() == null || m.getId().isEmpty()) {
			System.out.println("selectById Error 발생!");
			throw new IllegalAccessException("로그인 정보가 잘못 되었습니다.");
		}

		return mapper.selectById(m.getId());
	}

	// commit이 필요한 명령을 수행할때 적용하는 옵션
	// rollbackFor : 예외 처리 대상을 지정, 없어도 예외 발생시 Rollback이 되나 runtime 에러 일부를 커버 안한다.
	// isolation : 격리 레벨을 설정, Read Uncommitted, Read Committed, Repeatable Read, Serializable순으로 강해진다.
	//             레벨이 강하면 성능 저하가 발생하나 확실한 격리(isolation)를 제공
	// timeout : 쿼리의 최대 실행 시간을 설정한다.
	@Transactional(rollbackFor = {Exception.class, MyBatisSystemException.class},
			isolation = Isolation.SERIALIZABLE, timeout = 30)
	public int insertMember(Member member) throws IllegalAccessException {
		System.out.println("insertMember Call!!");
		int result = mapper.insertMember(member);
		if(result == 0){
			// 상위 insert 결과를 강제로 rollback 시키기 위한 throw문
			throw new IllegalAccessException();
		}
		return result;
	}


	// Transactional이 없는 insert문 + error가 발생하는 케이스, rollback이 되지 않는다!
	public int insertMemberForError(Member member) {
		System.out.println("insertMemberForError Call!!!");
		mapper.insertMember(member);
		mapper.insertMember(member);
		mapper.insertMember(member);
		mapper.insertMember(member);
		return 0;
	}

	// 예외가 발생할 경우 Rollback 처리가 되어 insert가 하나도 실행되지 않는다!
	@Transactional
	public int insertMemberForErrorCheck(Member member) {
		System.out.println("insertMemberForErrorCheck Call!!");
		mapper.insertMember(member);
		mapper.insertMember(member);
		mapper.insertMember(member);
		mapper.insertMember(member);
		return 0;
	}
}