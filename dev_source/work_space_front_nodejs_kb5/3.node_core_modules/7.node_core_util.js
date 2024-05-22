// node core module

// util 모듈
// - util 모듈은 node.js의 보조적인 유용한 기능들을 모아놓은 모듈
// http://nodejs.org/api/util.html

// 주요 메소드
// util.format(format, [...])
// util.debug(string)
// util.error([...])
// util.puts([...])
// util.print([...])
// util.log(string)
// util.inspect(object, [options])
// Customizing util.inspect colors
// util.isArray(object)
// util.isRegExp(object)
// util.isDate(object)
// util.isError(object)
// util.pump(readableStream, writableStream, [callback])
// util.inherits(constructor, superConstructor)

// util.format(format, [...])
// - 포멧팅된 문자열로 바꿔주는 함수
// %s - String
// %d - Number (both integer and float).
// %f - float 참고 : %.2f 이런거 안된다.
// %j - JSON
// %o: Object

const util = require('util');

const data = util.format('number : %d, number2 : %f str : %s, json : %j, obj : %o', 
                                         10, 3.141592, 'abc', { name: 'node.js'}, { name: 'node.js'});
 
console.log(data);
 