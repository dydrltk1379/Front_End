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
//		req.getSession().removeAttribute("SESSION_ID");
		req.getSession().invalidate();
		
		resp.setContentType("text/html;charset=utf-8");
		resp.getWriter().append("<script> alert('세션이 삭제되었습니다.'); "
				+ "location.href='" + req.getContextPath()+ "' </script>");
	}

}
