const { log } = require("console");
const fs = require("fs");

const data2 = fs.readFile('example.txt', (err, data)=>{
    if(err){
        log('error');
    }
    log(data.toString());
})
log('이걸 보고 싶은 거였어!! ======> 코드 끝');