
const http = require('http');
const index = require('./index.js');
const getContact = require('./getContact.js');
const getHome = require('./getHome.js');

const server = http.createServer((req, res)=>{
    const {url, mothod} = req;

    if(url === '/' || url === '/index'){
        index(req, res);
    } else if(url == '/get_page' && method == 'GET'){
        getTest.getContact(req, res);
    } else if(url.includes('/get_result') && method == 'GET'){
        getTest.getContactResult(req, res);
    } else if(url == '/post_page' && method == 'GET'){
        postTest.getHomePage(req, res);
    } else if(url.includes('/post_result') && method == 'GET'){
        postTest.getHomeResult(req, res);
    } else { 
        res.setHeader('Content-Type', 'text/html');
        res.end('<h1>Error!</h1>');
    }
});

server.listen(3000, '127.0.0.1', ()=>{
    console.log('Listening on 127.0.0.1:3000');
});