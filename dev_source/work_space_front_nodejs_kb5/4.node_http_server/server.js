
const http = require('http');
const home = require('./home.js');
const getTest = require('./getTest.js');
const postTest = require('./postTest.js');

// http 라우팅 main
const server = http.createServer((req, res)=>{
    // 요청 메소드, url 가져오기
    // console.log(req);
    // console.log(res);
    const {url, method} = req;
    console.log('url : ' + url + ', method : ' + method);

    // 수동 라우팅 코드
    if(url === '/' || url === '/home' || url === '/index'){
        home(req, res);
    } else if(url == '/get_page' && method == 'GET'){
        getTest.getTestPage(req, res);
    } else if(url.includes('/get_result') && method == 'GET'){
        getTest.getTestResult(req, res);
    } else if(url == '/post_page' && method == 'GET'){
        postTest.postTestPage(req, res);
    } else if(url.includes('/post_result') && method == 'POST'){
        postTest.postTestResult(req, res);
    } else { 
        res.setHeader('Content-Type', 'text/html');
        res.end('<h1>Error!</h1>');
    }
});


server.listen(3000, '127.0.0.1', ()=>{
    console.log('Listening on 127.0.0.1:3000');
});