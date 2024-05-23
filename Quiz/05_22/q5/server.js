
const http = require('http');
const index = require('./index.js');
const getContact = require('./getContact.js');
const getHome = require('./getHome.js');

const server = http.createServer((req, res)=>{
    const {url, method} = req;

    if(url === '/' || url === '/index'){
        index(req, res);
    } else if(url == '/contact' && method == 'GET'){
        getContact.getContactPage(req, res);
    } else if(url.includes('/get_contact') && method == 'GET'){
        getContact.getContactResult(req, res);
    } else if(url == '/home' && method == 'GET'){
        getHome.getHomePage(req, res);
    } else if(url.includes('/get_home') && method == 'GET'){
        getHome.getHomeResult(req, res);
    } else { 
        res.setHeader('Content-Type', 'text/html');
        res.end('<h1>Error!</h1>');
    }
});

server.listen(3000, '127.0.0.1', ()=>{
    console.log('Listening on 127.0.0.1:3000');
});