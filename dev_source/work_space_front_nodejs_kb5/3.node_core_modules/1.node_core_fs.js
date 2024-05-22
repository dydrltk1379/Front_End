// node core module
// fs (file system, 파일 시스템)
// - 파일 시스템을 활용하기 위한 모듈로 파일과 폴더의 읽기/쓰기/수정/삭제를 지원 한다.
// - fs 모듈은 크게 Promises, Callback, Synchronous 패턴으로 구분됨
//                  -> Callback기준으로 썻다가 요새 Promise를 씀
// - encoding을 지원함으로 적절한 인코딩 사용을 권장(최근은 utf-8로 거의 통일, euc-kr도 가끔 보임)
// https://nodejs.org/docs/latest/api/fs.html

// fs import문
// const fs = require('node:fs');
const fs = require('fs');

// 1. Callback 패턴

// 1.1 파일 읽기 - readFile(비동기), readFileSync(동기)
//  - fs.readFile(path[, options], callback) : 비동기식으로 파일 읽어 오는 메소드 // 순서 보장 안됨.
//  - fs.readFileSync(path[, options]) : 동기로 파일을 읽어서 리턴하는 메소드, 파일을 읽어 올 때까지 block
// path : ing> | <Buffer> | <URL> | <integer>
// options(obj) : encoding(null), flag(r), flush(false)
// callback(func) : func(error, data)

// const  기본
// 비동기, 순서 보장이 안되는 방식
const path1 = 'test_en.txt';
fs.readFile(path1, 'utf8', (error, data)=>{
    if(error) throw error;
    console.log('error');
    console.log('readFile');
    console.log(data);
});

// 동기, 코드 순서가 보장되는 방식
const path2 = 'test_ko.txt';
const readData = fs.readFileSync(path2, {encoding:'utf8'});
console.log('readFileSyn');
console.log(readData);

// 1.2 파일 쓰기 : writeFile(비동기), writeFileSync(동기)
// fs.writeFile(file, data[, options], callback) : 비동기식으로 파일 쓰는 메소드
// fs.writeFileSync(file, data[, options]) : 동기식으로 파일을 쓰는 메소드, 끝날때 까지 block된다. 리턴값 없음!
// fs.appendFile(path, data[, options], callback) : 파일을 추가로 쓸때 활용
// fs.appendFileSync(path, data[, options]) : 파일을 추가로 쓸때 활용, 사용법은 write와 같음
// file : <string> | <Buffer> | <URL> | <integer>
// data : <string> | <Buffer> | <TypedArray> | <DataView>
// options(obj) : encoding(default:'utf8'), mode(666), flag(w), flush(false), signal
// callback(func) : func(err)

// 비동기 방식
const path3 = "test_write1.txt";
const text1 = "Hello Node.js World! 어디서나 JavaScript 실행";
fs.writeFile(path3, text1, {encoding: 'utf8'}, (err)=>{
    if(err) throw err;
    console.log('End file write!')
});

// 동기 방식
const path4 = "test_write1.txt";
const text2 = "Hello Node.js World!Run JavaScript Everywhere.";
fs.writeFileSync(path4, text2, {encoding:'utf8'});

// 1.3 디렉토리 읽기 - readdir(비동기), readdirSync(동기)
// https://nodejs.org/docs/latest/api/fs.html#fsreaddirpath-options-callback
// fs.readdir(path[, options], callback)
// fs.readdirSync(path[, options])

// 비동기식으로 파일리스트 가져오기
fs.readdir('./', (err, files)=>{
    if(err) {
        console.log(err);
        return;
    }
    console.log(files);
});

// 동기식으로 파일리스트 가져오기
const files = fs.readdirSync('./');
console.log(files);

// 1.4 파일있는지 확인하는 방법 + 폴더 생성
// fs.existsSync(path) : 경로에 파일이 있는지 확인하는 방법
// fs.mkdir(path[, options], callback)
// fs.mkdirSync(path[, options])
// fs.mkdir(path[, options], callback)
// fs.rmdirSync(path[, options])

const dirPath = './test_dir';

if (fs.existsSync(dirPath)) {
  console.log("folder already exists");
} else {
  fs.mkdirSync(dirPath);
}
// fs.rmdirSync(dirPath);

// 1.5 기타
// fs.unlinkSync(path) : 파일 삭제
// fs.rmSync(path[, options]) : 파일 삭제
// fs.renameSync(oldPath, newPath) : 파일 이름 변경

// 2. promises 패턴
// - 기존 callback 구조를 promises를 기반으로 설계한 구조

// promise import
const fsPromises = require('fs').promises;

// 2.1 파일 읽기
// fsPromises.readFile(path[, option]);

async function readFunc(){
    try{
        const data = fsPromises.readFile('./test_ko.txt');
        console.log('fsPromises.readFile end');
        console.log(data); // buffer를 string으로 변환
    }catch(err){
        console.log(err);
    }
}
readFunc();

// 2.2 파일 쓰기
// fsPromises.writeFile(file, data[, options])
(async function writeFunc() {
  const data = 'Hello Node.js World!\nRun JavaScript Everywhere.';
  try {
    await fsPromises.writeFile('./test_write_p.txt', data);
    console.log('fsPromises.writeFile END!');
  } catch (err) {
      console.error(err);
  }
})();
console.log()



