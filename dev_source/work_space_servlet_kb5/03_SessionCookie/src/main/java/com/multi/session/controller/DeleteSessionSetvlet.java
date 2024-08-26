package com.multi.session.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletesession.do")
public class DeleteSessionSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 삭제하는 방법
//		req.getSession().removeAttribute("SESSION_ID"); // 하나씩 삭제됨
		req.getSession().invalidate(); // 한번에 모두 삭제됨(이걸 사용)
		
		resp.setContentType("text/html;charset=utf-8");
		resp.getWriter().append("<script> alert('세션이 삭제되었습니다.'); "
				+ "location.href='" + req.getContextPath()+ "' </script>");
	}

}
