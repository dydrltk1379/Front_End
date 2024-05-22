
// Node.js란? - https://nodejs.org/en
// "Run JavaScript Everywhere!"
// V8기반 JavaScript를 브라우저 없이 다양한 OS에서 실행할 수 있게 해주는 런타임 환경

// Wiki ver.
// - Node.js는 JS 기반 -크로스플랫폼 오픈소스-로 런타임 환경으로 윈도우, 리눅스, macOS 등에서 실행가능
// - Node.js는 V8 엔진으로 기반으로 작동되며, 크롬(크로미엄) 없이 단독으로 js 코드를 실행하다.
// - 주로 확장성 있는 네트워크 애플리케이션과 서버 사이드 개발에 사용되는 소프트웨어 플랫폼이며, 
//   논블로킹(Non-blocking) I/O와 단일 스레드 이벤트 루프를 통한 높은 처리 성능을 가지고있다.
// - 자체 HTTP 서버 라이브러리가 있음으로 별도의 웹 서버 없이 동작 가능하다. 

// 추가 정리
// - 한국에서 Node.js는 과거에는 소규모 프로젝트나 스타트업에서 많이 활용되는 프레임워크로 인식됨
//   -> 사유는 node로 개발이 더 쉽고 js를 기반으로 모든 프로젝트 언어를 js로 통일할수 있어 개발
// - node는 Non-blocking기반의 Single Thread인데, 이는 복잡한 대용량처리 기준으로 java보다 성능이 떨어짐
// - 또한 node의 보안 취약점은 아직 기업들에서 완벽히 컨트롤 하기에는 어렵다는 인식이 다분 
//   -> 물론 java도 보안적 리스크는 존재하나 기업들이 이를 연구해 대부분 통제 가능한 범위로 들어옴
// - 최근에는 MSA로 인하여 Micro Service 설계가 유행이고, k8s를 통해 성능적 보완된 아키텍처로 유행
//   -> node를 단독으로 사용하기 보단 -front 설계를 node+SPA로 대응하고 back-end는 spring으로 설계-
// - 현시점에도 핵심적인 비지니스는 Spring(Java)로 비핵심적인 비지니스는 Node로 구성하는 것이 보편적인 구성

// node 관련하여 참고하면 좋은 글
// - https://cdragon.tistory.com/entry/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%94%84%EB%A7%81JavaSpring%EC%99%80-Nodejs-%EB%8C%80%EA%B8%B0%EC%97%85%EC%9D%80-%EC%9E%90%EB%B0%94-%EC%8A%A4%ED%83%80%ED%8A%B8%EC%97%85%EC%9D%80-Nodejs-Spring%EA%B3%BC-Nodejs-%EC%A4%91%EC%97%90-%EA%B3%A0%EB%AF%BC%EC%9D%B4%EC%8B%A0%EA%B0%80%EC%9A%94
// - https://medium.com/naverfinancial/node-js-vs-java-spring-c4699565918e


// Node.js 코드 실행 방법
// - 'node <file_name>' 명령어를 통해 js 기반 코드를 실행할수 있다.
// - vscode 사용시 js를 node로 실행하도록 설정하고 '실행-디버거 실행'을 통해 실행 가능
// - npm 활용 시에는 node 명령어를 직접 사용하지 않고, npm 명령어로 실행 필요

// https://nodejs.org/en

// server.mjs
// import { createServer } from 'node:http'; // ES module이 없어서 error 발생!
const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello World!\n');
});

// starts a simple http server locally on port 3000
server.listen(3000, '127.0.0.1', () => {
  console.log('Listening on 127.0.0.1:3000');
});

// run with `node 0. basic.js`
