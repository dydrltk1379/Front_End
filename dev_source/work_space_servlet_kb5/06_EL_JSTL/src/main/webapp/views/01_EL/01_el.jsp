<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2024-08-01
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>EL(Expression Language) 실습부 코드 </h2>
    <hr><br>

    <h3>1. 기존 JSP 1.0(스크립틀릿)을 통한 Scope 객체를 가져오는 방법</h3>
    request : <%= request.getAttribute("scope") %> <br>
    session : <%= session.getAttribute("scope") %> <br>
    application : <%= application.getAttribute("scope") %> <br>
    null 값 : <%= request.getAttribute("없는 값") %> <br>
    null 없애는 법 : <%= request.getAttribute("없는 값") == null ? "" : request.getAttribute("없는 값") %> <br>
    <hr><br>

    <h3>2. EL을 통해 Scope 객체를 가져오는 방법</h3>
    <h4>2.1 가장 기본적인 사용법</h4>
    scope : ${scope} <br> <!-- 가장 작은 범위의 scope 영역의 값을 가져온다.-->
    scope : ${member} <br> <!-- toString을 자동으로 호출 -->
    member의 이름 : ${member.name} <br> <!--  -->
    member의 나이 : ${member.age} <br>
    member의 scope : ${member.scope} <br>
</body>
</html>
