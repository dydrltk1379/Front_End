
const fs = require('fs');
const path = require('path');
const url = require('url');

// get form html을 응답하는 메소드
const getTestPage = (req, res) =>{
    // home.html을 전송하는 코드
    res.setHeader('Content-Type', 'text/html');
    const htmlPath = path.join(__dirname, 'assets', 'get_page.html');
    const rs = fs.createReadStream(htmlPath, 'utf-8');
    rs.pipe(res);
}

// http://127.0.0.1:3000/get_result?id=test4&pw=pw12345678&mname=%ED%99%8D%EA%B8%B8%EB%8F%99&age=31

// 파라메터를 받아 json으로 만들어주는 메소드
const getTestResult = (req, res) =>{
    res.writeHead(200, { 'Content-Type': 'application/json'});
    console.log(req.url);
    const urlObj = url.parse(req.url, true);
    res.end(JSON.stringify(urlObj.query));
}

module.exports = {getTestPage, getTestResult};