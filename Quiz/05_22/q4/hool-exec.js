const http = require('http');

const server = http.createServer((req,res)=>{
    console.log(req);
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello Node');
});
server.listen(3000,()=>{
    console.log('3000번 포트 실행중')
});
