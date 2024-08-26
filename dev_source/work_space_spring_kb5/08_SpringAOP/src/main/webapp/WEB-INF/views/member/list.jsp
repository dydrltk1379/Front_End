<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<head>
<script type='text/javascript' src='http://code.jquery.com/jquery-3.3.1.js'></script>
<title>Home</title>
</head>
<body>
	<h1>회원 목록</h1>
	<button id="button1">조회</button>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
			<th>비밀번호</th>
		</tr>
	</table>
	
	<script type="text/javascript">
		$(function () {
			$('#button1').click(function (){
				$.ajax({
					url : '${path}/memberAllList.do',
					type : 'get',
					success : function(result) {
						html = '';
						for(var i = 0; i < result.length; i++){
							html += '<tr>';
							html += '<td>' + result[i]['id'] + '</td>';
							html += '<td>' + result[i]['name'] + '</td>';
							html += '<td>' + result[i]['age'] + '</td>';
							html += '<td>' + result[i]['address'] + '</td>';
							html += '<td>' + result[i]['pw'] + '</td>';
							html += '</tr>';
						}
						$('table > tbody').append(html);
					},
					error : function () {
						console.log("AJAX 통신 실패!");
					}
				});
			});
		});
	</script>
	
</body>
</html>
