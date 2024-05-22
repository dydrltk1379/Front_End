// node core module

// https://www.daleseo.com/js-node-path/

// path (경로)
// - node에서 os의 경로를 다루기 위한 모듈
// - 운영체제 마다 다른 경로 문자열이나 경로를 다루기 위해 활용
// - node의 경우 대부분이 linux server에서 실행됨으로 이에 맞는 경로 설정이 매우 중요!
// https://nodejs.org/docs/latest/api/path.html

// path module import
const path = require('path');

// 경로 구분자 확인하기
console.log('path.sep : ' + path.sep); // \
console.log('path.delimiter : ' + path.delimiter); // ;

// join : OS별로 경로 만들기
let path1 = path.join('dev', 'src', 'test.txt'); // dev\src\test.txt
console.log(path1);

// resolve : cd 명령처럼 탐색 처럼 동작
let path2 =  path.resolve('/a', 'b', 'c'); // C:\a\b\c
let path3 =  path.resolve('/a', '/b', 'c'); // C:\b\c
let path4 =  path.resolve('/a', '/b', '/c'); // C:\c
console.log(path2);
console.log(path3);
console.log(path4);


// 파일의 이름을 가져오기 + 확장자 빼기
let basename1 =  path.basename('/test/dir/test.txt'); // test.txt
let basename2 =  path.basename('/test/dir/test.txt', '.txt'); // test
console.log(basename1); 
console.log(basename2);


// 확장자 가져오기 
let extname1 = path.extname('/test/dir/test.txt'); // txt
console.log(extname1);


// 절대경로 인지 확인하는 방법
let result1 = path.isAbsolute('/test/dir/test.txt'); // true
let result2 = path.isAbsolute('./test.txt'); // false
console.log(result1);
console.log(result2);


// 복잡한 경로를 정리하는 방법
let normalPath = path.normalize('/test/../dir//test.txt'); // \dir\test.txt
console.log(normalPath);
