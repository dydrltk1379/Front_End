
const fs = require('fs');
const path = require('path');
const url = require('url');
const { getTestResult } = require('../../../dev_source/work_space_front_nodejs_kb5/4.node_http_server/getTest');

const getContactPage = (req, res)=>{
    res.setHeader('Content-Type', 'text/html');
    const htmlPath = path.join(__dirname, 'assets', 'contact.html');
    const rs = fs.createReadStream(htmlPath, 'utf-8');
    rs.pipe(res);
}

const getContactResult = (req, res)=>{
    res.writeHead(200, {'Content-Type': 'application/json'});
    const urlObj = url.parse(req.url, true);
    res.end(JSON.stringify(urlObj.query));
}

module.exports = {getContactPage, getContactResult};