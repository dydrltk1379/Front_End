
// 모듈(Module)이란?
// - 프로그램의 분리 단위로 일반적으로 기능이나 파일 단위로 프로그램을 관리하는 기법
// - node에서의 module은 .js 파일 단위로 관리 되며, <script></script> 태그와 유사하게 작동한다.
// - 내장 모듈(core 모듈) : node에서 이미 작성 해놓은 모듈로 기본적으로 사용할수 있는 모듈 ex) fs, http ...
// - 외부 모듈 : 외부에서 만들어진 모듈로 npm으로 관리하는 것이 일반적, ex) express, mongoose axios ...
// - 사용자 모듈 : 사용자가 작성한 모듈(코드)
// *express를 쓰고 node를 사용*

// require 함수
// - const moduleName = require('경로'); // 고전
// - 외부에서 만들어진 모든 모듈을 가져오는 방법
// - 향후 es 사용시 import문으로 대체되는 문장
//   -> 최근에는 대부분 import을 활용하는 것이 일반적이다.

// 내장 모듈 가져오는 법
const fs = require('fs');
const http = require('http'); // node:http

// module.exports
// - 자신의 코드를 외부에서 사용할수 있도록 export하는 방법

const print = (data) => {
    console.log(data);
};

module.exports = print
// module.export {obj1, obj2}; // 객체 구조로 내보내는 방법


// 외부에서 사용하는 방법
const printModule = require('1.module.js'); // 함수일 때
const printModule = require('1.module'); // .js는 생략 가능!
const {obj1, obj2} = require('1.module'); // 객체로 내보냈을 경우 구조분할 할당으로 분리


// printModule() // 함수일때
console.log(obj1.name + ', ' + obj2.name) // 객체일떼

