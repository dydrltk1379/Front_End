// node core module 상식

// Stream
// - file, socket, pipe에서 사용 되는 개념으로 지속적으로 데이터를 읽기/쓰기/송수신 할 수 있는 통로
// - buffer를 활용할수 있어 데이터의 읽기/쓰기 속도를 개선할수 있다. 그만큼 메모리도 필요 
// - 성능적인 이점도 있지만 코드 구성의 편리성이 존재하여 사용되는 경우도 많음
// https://nodejs.org/docs/latest/api/stream.html

// Readable Streams
// : 데이터를 읽기 위한 스트림, 네트워크에 연결한 상태에서 데이터를 read/파일에서 read
// Writable Streams
// : 데이터를 쓰기 위한 스트림, 네트워크에 연결한 상태에서 데이터를 write/파일에 write
// Duplex Streams
// : 읽기 쓰기 모두 가능한 스트림, 실시간 양방향 통신에 사용
// Transform Streams
// : 데이터를 쓰고 읽을 때 데이터를 수정하거나 변환할 수 있는 이중 스트림

const fs = require('fs');

// readable stream 
// - fs.createReadStream(path[, options])
const readStream = fs.createReadStream('test_en.txt', 'utf8');
readStream.on('data', (chunk) => {
  console.log(chunk);
});
readStream.on('end', () => {
  console.log('end');
}); 
readStream.on('error', err => {
  console.error('에러', err);
});


// writable stream
// - fs.createWriteStream(path[, options])
const writeStream = fs.createWriteStream('write_stream.txt');
writeStream.write('Hello, Streams!');
writeStream.end();


// duplex stream  
// - pipe를 활용한다. fs을 활용하는 경우 파일 복사가 된다. 
const readstream = fs.createReadStream('test_en.txt');
const writestream = fs.createWriteStream('write_stream2.txt');
readstream.pipe(writestream);

