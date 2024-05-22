// node core module

// url
// - url 정보를 객체로 가져와서 분석(parse)하거나 문자열로 바꿔주는 기능(format, resolve)을 수행

// url 파싱
// url.parse(urlStr, [parseQueryString], [slashesDenoteHost])

let url = require('url');
let urlObject = url.parse('http://localhost:3000/path/abc.html?id=student&page=12#hash', true);

console.log(urlObject); // url 객체 정보 출력
console.log(url.format(urlObject)); // url 객체를 문자열로 출력

// parse
// - true : url 객체의 query 속성을 객체 형식으로 가져옵니다.
// - false : url 객체의 query 속성을 문자열 형식으로 가져옵니다.
var queryData = url.parse('http://localhost:3000/path/abc.php?id=student&page=12#hash', true).query;
console.log(queryData);

// parseQueryString
// - queryString을 파싱하는 함수, node에서는 post 방식에서 활용된다.
var querystring = require('querystring');
let query = 'text=한글테스트&id=test&age=10';
let queryObj = querystring.parse(query);
console.log(queryObj);

