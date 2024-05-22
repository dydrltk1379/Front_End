// node core module 실용

// crypto
// - node에서 암호화 기능을 제공하는 모듈
// - 단방향 암호(hash, sha-256), 양방향 암호(aes)등 여러 암호화 방법을 제공 
// https://nodejs.org/api/crypto.html


// 단방향 암호 - 해시코드 생성법
// - 해시는 단방향 암호로 암호화 알고리즘이 일치하면 plain값이 항상 같은 해시 값으로 나온다.
// - 주로 무결성 검증이나 사용자의 암호를 저장하는 용도로 활용한다.
//   -> 로그인의 원리는 사용자 암호를 hash로 변환하여 관리, 유출되도 원래 암호로 쉽게 유출할수 없음.

const crypto = require('crypto');

// sha512 : 해시 암호화 알고리즘, 더 많은 알고리즘이 있지만 암호화 보안 강도에 따라 알고리즘이 제한됨
// https://isc9511.tistory.com/66
const createHashedPassword = (password) => {
  return crypto.createHash("sha512").update(password).digest("base64");
};

console.log('hash');
console.log(createHashedPassword("1234"));
console.log(createHashedPassword("1234"));
console.log('end');


// 양방향 암호 - aes 기반 암호화 및 복호화 방법 예제 // 혹은 https
// 통신  

// 암호화 알고리즘 관련 설정
const algorithm = 'aes-256-cbc'; // 암호화 알고리즘을 설정, 알고리즘이름-강도-키스트림방법
const key = crypto.scryptSync('your password','your salt', 32); // password : , salt : random key
const iv = crypto.randomBytes(16); 

// 암호화
let text = 'Hello World!'; 
const cipher = crypto.createCipheriv(algorithm, key, iv);
let result = cipher.update(text, 'utf8', 'base64');
result += cipher.final('base64');
console.log('암호화: ', result);

// 복호화
const deciper = crypto.createDecipheriv(algorithm, key, iv);
let result2 = deciper.update(result, 'base64', 'utf8');
result2 += deciper.final('utf8');
console.log('복호화: ', result2);


