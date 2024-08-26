package com.multi.mybatis.board.model.vo;

// BoardDTO, BoardForm, BoardParam

import com.multi.mybatis.common.PageInfo;
import lombok.Data;

// 게시판 검색시 사용하는 변수를 정리한 객체(HTML-From이 있는 인자들)
@Data
public class boardForm {
    private String title; // 제목
    private String content; // 내용
    private String writer; // 글 쓴 사람
    private PageInfo pageInfo;
}
