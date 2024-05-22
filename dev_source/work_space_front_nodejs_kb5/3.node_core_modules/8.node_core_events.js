// node core module

// Event
// - 사용자의 event를 만들기 위한 helper 모듈
// https://nodejs.org/api/events.html


// 사용자 정의 이벤트 작성법
const EventEmitter = require('node:events');
// var EventEmitter = require('events');

class MyEmitter extends EventEmitter {} // EventEmitter
const myEmitter = new MyEmitter();

// 이벤트를 등록하는 방법
myEmitter.on('event', () => {
  console.log('an event occurred!');
});

// 아래 파일은 외부에서 호출해도 상위 이벤트 메소드가 호출됨
myEmtter.emit('event');
