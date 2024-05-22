
const fs = require('fs');
const path = require('path');

const home = (req, res)=>{
    // home.html을 전송하는 코드
    res.setHeader('Content-Type', 'text/html');
    const htmlPath = path.join(__dirname, 'assets', 'home.html');
    const rs = fs.createReadStream(htmlPath, 'utf-8');
    rs.pipe(res);
}

module.exports = home;