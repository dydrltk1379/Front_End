// node core module

// http 
// - HTTP 서버와 클라이언트를 구현하기 위한 기본 모듈 
// - HTTP 요청과 응답을 처리 할수 있도록 설계되어 있음
// - http은 원초적인 http 프로토콜을 처리하도록 설계되어 있음
//   -> 실제 서비스를 만들기 위해선 매우 복잡한 프로그래밍이 필요 Express 활용 권장!!
// - http=Servlet, Express=Spring으로 이해 하면 편함
// https://nodejs.org/docs/latest/api/http.html


// http : http웹 서버와 관련된 모든 기능을 담은 모듈의 이름
// server :	웹 서버를 생성할 때 사용하는 객체

// req : request의 약자, 클라이언트의 요청에 대한 정보를 포함하는 객체
// 파라미터를 못 받아서 메소드로 받아야 함.
// req.method: HTTP 메소드 (GET, POST, 등).
// req.url: 요청된 URL.
// req.headers: 요청 헤더.
// req.on('data', callback): 요청 본문 데이터가 있을 때 스트림 형태로 데이터를 처리.
// req.on('end', callback): 요청 본문 데이터 수신 완료 시 처리.


// res : response의 약자, 클라이언트 응답 정보를 생성하기 위해 활용하는 객체
// res.statusCode: HTTP 상태 코드 설정.
// res.setHeader(name, value): 응답 헤더 설정.
// res.write(chunk): 응답 본문에 데이터를 씀.
// res.end([data]): 응답 종료, 선택적으로 데이터를 포함할 수 있음.

// http 임포트
// const http = require('node:http');
const http = require('http'); // 모듈을 불러온다.

// createServer
const server = http.createServer((req, res) => {
  // req.setEncoding('utf8');
  console.log(req);
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello Node.js World!');
});

server.listen(3000,()=>{
  console.log('3000번 포트 실행중')
});

