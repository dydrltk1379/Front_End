package com.multi.servletbasic.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

// http://localhost:8080/ServletBasic_war/method.do?name=%ED%99%8D%EA%B8%B8%EB%8F%99&age=21&gender=%EB%82%A8%EC%84%B1&height=170&hobby=%EC%B6%95%EA%B5%AC&hobby=%EC%95%BC%EA%B5%AC&hobby=%EA%B2%8C%EC%9E%84
@WebServlet("/method.do")
public class HttpMethodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get 요청");
        // 사용자 파라미터 처리하는 방법, HttpServletRequest에서 getParameter을 통해 처리 가능
        String name = req.getParameter("name");
        String age = req.getParameter("age");
        int intAge = Integer.parseInt(age); //
        String gender = req.getParameter("gender");
        String height = req.getParameter("height");
        String hobby = req.getParameter("hobby");
        // 다중 name을 처리할 경우 getParameterValues로 뱅열로 처리한다.
        String[] hobbies = req.getParameterValues("hobby");

        System.out.println("name : " + name);
        System.out.println("age : " + age);
        System.out.println("gender : " + gender);
        System.out.println("height : " + height);
        System.out.println("hobbies : " + Arrays.toString(hobbies));

        // 응답 처리부
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("<h1>사용자 정보 출력</h1>");
        out.printf("<div>이름 : %s</div>", name);
        out.printf("<div>나이 : %s</div>", age);
        out.printf("<div>성별 : %s</div>", gender);
        out.printf("<div>신장 : %s</div>", height);
        out.printf("<div>취미(단일) : %s</div>", hobby);
        out.printf("<div>취미(전체) : %s</div>", Arrays.toString(hobbies));
        out.println("</body>");
        out.println("</html>");
    }

    // post를 생성하지 않고 실행하면
    // HTTP 상태 405 – 허용되지 않는 메소드
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post 요청");
        req.setCharacterEncoding("UTF-8"); // 사용자 요청 정보에 인코딩하여 값을 가져와야 한다.
        doGet(req, resp);
    }
}
