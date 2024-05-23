// Express.js란?

// - Node.js를 위한 웹 프레임워크의 하나로, MIT 자유-오픈 소스 소프트웨어로 출시
// - 웹 애플리케이션, API 개발을 위해 설계, Node.js의 사실상의 표준 서버 프레임워크로 불리고 있다.
// - java의 spring과 비슷한 포지션으로 node.js의 대표 서버 프레임워크이다.

// https://expressjs.com/en/4x/api.html
// https://expressjs.com/ko/api.html#req
// https://expressjs.com/ko/api.html#res


const express = require('express');

const app = express();

// 정적파일(statiic) 라우팅을 위해 static 폴더 지정
app.use(express.static('public'));
// 템플릿 엔진 활용을 위해 ejs 적용
app.set("view engine", "ejs");
// views 폴더를 기본 템플릿 폴더로
app.set('views', __dirname + '/views');
// json 파라미터 처리를 위해 적용
app.use(express.json());
// post(post x-www-form-urlencoded) 처리를 적용
app.use(express.urlencoded());

// port 번호 지정
const port = 3000; // 0 65555

// get방식 처리하는 방법
// https://expressjs.com/en/4x/api.html#app.get
// path 3가지 패턴이 올수 있다. '/'=root, ['/', '/index', '/home'], '^home*[0-9]*$'=정규식 도 가능
app.get(['/', '/index', '/home'], (req, res) => {
    res.status(200);
    res.render('home'); // app.set('views', __dirname + '/views')로 인해 경로 생략 가능
  // res.render( __dirname + '/views' + 'home'); // 이건 안돌아간다. 
});

// 외부에서 선언한 라우터(handler)를 적용하는 방법
// https://expressjs.com/en/4x/api.html#app.use
app.use('/', require('./routes/getTest'));


app.listen(port, ()=>{
    console.log(`${port}번으로 서버 실행중`);
});