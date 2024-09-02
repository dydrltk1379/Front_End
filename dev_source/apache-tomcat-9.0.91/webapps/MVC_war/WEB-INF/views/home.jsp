<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
        .divclass {
            width: 800px;
            height: 340px;
            background-color: lightgray;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h2>Spring Security + JWT Test page</h2>
    <hr><br>

    <h3>1. 로그인 시도하기</h3>
    id : <input id="id" type="text"><br>
    password : <input id="password" type="text"><br>
    token : <input id="token" type="text" maxlength="1000"><br>
    <button onclick="login()">로그인</button>
    <button onclick="logout()">로그아웃</button>
    <button onclick="login(true)">토근 저장하기</button>
    <button onclick="removeToken()">토근 삭제하기</button>
    <br><br>
    <div id="result" class="divclass">

    </div>

    <script>
        let localToken = localStorage.getItem('token');
        if(localToken != null){
            document.getElementById('token').setAttribute('value',localToken);
        }

        const login = async (saveToken) => {
            const url = "${path}/member/login";
            let id = document.getElementById('id').value;
            let password = document.getElementById('password').value;

            try {
                const response = await axios.post(url, {id:id,password:password});
                console.log("# 응답객체 : ", response);
                document.getElementById('result').innerHTML = '응답 객체<br>' + JSON.stringify(response.data).replaceAll(',"',',<br>"');
                if(saveToken === true){
                    const token = response.data.token;
                    document.getElementById('token').setAttribute('value',token);
                    localStorage.setItem('token', token);
                }
            } catch (e) {
                console.log("## 다음 오류가 발생했습니다.");
                alert('오류 발생!');
                document.getElementById('result').innerHTML = '에러 내용<br>' + JSON.stringify(e.message);
                if (e instanceof Error) console.log(e.message);
                else console.log(e);
            }
        };

        const logout = async () => {
            const url = "${path}/member/logout";

            try {
                const response = await axios.get(url);
                console.log("# 응답객체 : ", response);
                document.getElementById('result').innerHTML = '응답 객체<br>' + JSON.stringify(response.data).replaceAll(',"',',<br>"');
            } catch (e) {
                console.log("## 다음 오류가 발생했습니다.");
                alert('오류 발생!');
                document.getElementById('result').innerHTML = '에러 내용<br>' + JSON.stringify(e.message);
                if (e instanceof Error) console.log(e.message);
                else console.log(e);
            }
        };
        const removeToken = async () => {
            localStorage.removeItem('token');
            document.getElementById('token').setAttribute('value','');
        }
    </script>
    <hr><br>

    <h3>2. Rest 요청하기(GET) </h3>
    <button onclick="getCatInfo()">Cat Rest 요청하기(GET - ALL)</button>
    <br><br>
    <div id="restResult" class="divclass"></div>

    <script>
        const getCatInfo = async () => {
            const url = "${path}/rest/cat";
            const saveToken = document.getElementById('token').getAttribute('value');

            try {
                let config = {
                    headers :{'Authorization':'Bearer ' + saveToken},
                };

                const response = await axios.get(url, config);
                console.log("# 응답객체 : ", response);
                document.getElementById('restResult').innerHTML = '응답 객체<br>' + JSON.stringify(response.data).replaceAll(',"',',<br>"');
            } catch (e) {
                console.log("## 다음 오류가 발생했습니다.");
                alert('오류 발생!');
                document.getElementById('restResult').innerHTML = '에러 내용<br>' + JSON.stringify(e.message);
                if (e instanceof Error) console.log(e.message);
                else console.log(e);
            }
        };
    </script>
    <hr><br>

    <h3>3. Rest 요청하기 (POST + GET) </h3>
    <button onclick="createCat()">Cat POST(도라에몽)</button><br>
    <button onclick="getCatInfo2()">Cat GET(name=도라에몽)</button>
    <br><br>
    <div id="postResult" class="divclass"></div>

    <script>
        const createCat = async () => {
            const url = "${path}/rest/cat";
            const saveToken = document.getElementById('token').value;

            try {
                let config = {
                    headers :{'Authorization':'Bearer ' + saveToken},
                };
                let data = {
                    name : '도라에몽',
                    info : '미래에서 온 고양이, 진구랑 친하다.',
                    color : '파랑',
                    weight : '121',
                }
                const response = await axios.post(url, data, config);
                console.log("# 응답객체 : ", response);
                document.getElementById('postResult').innerHTML = '응답 객체<br>' + JSON.stringify(response.data).replaceAll(',"',',<br>"');
            } catch (e) {
                console.log("## 다음 오류가 발생했습니다.");
                alert('오류 발생!');
                document.getElementById('postResult').innerHTML = '에러 내용<br>' + JSON.stringify(e.message);
                if (e instanceof Error) console.log(e.message);
                else console.log(e);
            }
        };

        const getCatInfo2 = async () => {
            const url = "${path}/rest/cat?name=도라에몽";
            const saveToken = document.getElementById('token').value;

            try {
                let config = {
                    headers :{'Authorization':'Bearer ' + saveToken},
                };

                const response = await axios.get(url, config);
                console.log("# 응답객체 : ", response);
                document.getElementById('postResult').innerHTML = '응답 객체<br>' + JSON.stringify(response.data).replaceAll(',"',',<br>"');
            } catch (e) {
                console.log("## 다음 오류가 발생했습니다.");
                alert('오류 발생!');
                document.getElementById('postResult').innerHTML = '에러 내용<br>' + JSON.stringify(e.message);
                if (e instanceof Error) console.log(e.message);
                else console.log(e);
            }
        };
    </script>
    <hr><br>

    <h3>4. Rest 요청하기 (DELETE) </h3>
    <input id="deleteid" type="text">
    <button onclick="deleteCat()">Cat DELETE</button><br>
    <br>
    <div id="deleteResult" class="divclass"></div>

    <script>
        const deleteCat = async () => {
            const deleteID = document.getElementById('deleteid').value;
            const url = "${path}/rest/cat/" + deleteID;
            const saveToken = document.getElementById('token').value;
            try {
                let config = {
                    headers :{'Authorization':'Bearer ' + saveToken},
                };

                const response = await axios.delete(url, config);
                console.log("# 응답객체 : ", response);
                document.getElementById('deleteResult').innerHTML = '응답 객체<br>' + JSON.stringify(response.data).replaceAll(',"',',<br>"');
            } catch (e) {
                console.log("## 다음 오류가 발생했습니다.");
                alert('오류 발생!');
                document.getElementById('deleteResult').innerHTML = '에러 내용<br>' + JSON.stringify(e.message);
                if (e instanceof Error) console.log(e.message);
                else console.log(e);
            }
        };
    </script>
    <hr><br>


</body>
</html>