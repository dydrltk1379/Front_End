<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>Login</title>
</head>
<body>
	<h1>Login 성공페이지</h1>

	<h3>${loginMember.name}님이 로그인 하셨습니다.</h3>
	<br>
	<a href="${path}/">시작 페이지</a>

</body>
</html>
