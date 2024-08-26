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
	<h1>Join Page</h1>
	
	<form name="joinForm" action="${path}/join.do" method="post">
		<fieldset>
			<legend>회원가입</legend>
			아이디 : <input type="text" id="id" name="id"> <span id="checkId">중복 확인</span> <br>
			비밀번호 : <input type="password" name="pw"><br>
			이름 : <input type="text" name="name"><br>
			나이 : <input type="text" name="age"><br>
			주소 : <input type="text" name="address"><br>
			<input type="submit" value="가입">
		</fieldset>
	</form>
	
	<script type="text/javascript">
		// id의 중복을 확인하는 코드, keyup(키보드 입력)이 될때마다 id를 체크해서 checkId로 결과 업데이트 됨
		$(function(){
			$('#id').keyup(function() {
				var idValue = $(this).val();
				$('#checkId').html('입력중..');
				$.ajax({
					url : '${path}/checkId.do',
					data : {id : idValue},
					type : 'get',
					success : function(result) {
						if(result == '0'){
							$('#checkId').html('사용 가능한 아이디입니다.');
						} else{
							$('#checkId').html('중복된 아이디입니다. 다시 입력하세요.');
						}
					}, 
					error : function () {
						console.log('ajax 통신 실패');
					}
				});
			});
		});
	</script>
	
</body>
</html>
