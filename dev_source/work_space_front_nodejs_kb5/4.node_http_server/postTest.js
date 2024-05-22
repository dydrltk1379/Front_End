
const fs = require('fs');
var querystring = require('querystring');

const postTestPage = (req, res)=>{
    res.setHeader('Content-Type', 'text/html');
    const rs = fs.createReadStream(__dirname + '/assets/post_page.html', 'utf-8');
    rs.pipe(res);
}

const postTestResult = (req, res)=>{
    console.log(req);
    let str = '';
    
    req.on('data', function (data) {
        console.log(data);
        str = String(data);
    });
    
    req.on('end', function () {
        const queryObj = querystring.parse(str);
        console.log('str');
        console.log(str);
        console.log(queryObj);
        res.writeHead(200, { 'Content-Type': 'application/json'});
        res.end(JSON.stringify(queryObj));
    });
 
}

module.exports = {postTestPage, postTestResult};
