package com.multi.aop.model.mapper;


import com.multi.aop.model.vo.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    List<Member> selectAll();
    Member selectById(String id);
    int insertMember(Member member);
}
