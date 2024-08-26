<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-3.3.1.js'></script>
</head>
<body>
	<div style="overflow:scroll; width:350px; height:200px;" id="msgArea">
	</div>
	<br>
	메세지 : <input type="text" id="chatMsg"><br>
	귓속말 보낼 아이디 : <input type="text" id="target"><br>
	(없는 경우 전체)<br>
	<button id="sendBtn">전송</button>
</body>
</html>

<script>
	var ws;
	var memberId = "${sessionScope.member.memberId}";

	function connect() {
		ws = new WebSocket('${path}/chat');
		ws.onopen = function() {
			console.log("웹소켓 연결 생성");

			var msg = {
				type: "register",
				memberId: memberId
			}

			ws.send(JSON.stringify(msg));
		};

		ws.onerror = function(event){
			console.log(event);
		}
		ws.onmessage = function(e) {
			
		};

		ws.onclose = function() {
			console.log(ws);
			console.log("연결종료");
		};
	}
	connect();

	$(function() {
		$("#sendBtn").click(function() {
			var chat = $("#chatMsg").val();
			var msg = $("#msgArea").val();


			ws.send(JSON.stringify(sendMsg));
		});
	});
</script>