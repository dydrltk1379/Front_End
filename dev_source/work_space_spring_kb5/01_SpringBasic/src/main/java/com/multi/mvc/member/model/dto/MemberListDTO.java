package com.multi.mvc.member.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberListDTO {
    private List<MemberDTO> list; // 파라미터 배열을 처리하기 위한 list 멤버변수
}
