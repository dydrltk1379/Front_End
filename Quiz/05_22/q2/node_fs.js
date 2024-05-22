
const fs = require('fs');
const fsPromises = require('fs').promises;

const path1 = 'me.txt';
const readData = fs.readFileSync(path1, {econding:'uts8'});
console.log(readData);

const dirPath = './me.txt';
if(fs.existsSync(dirPath)){
    console.log("folder alreay exsits");
}else{
    fs.mkdirSync(dirPath);
}

(async function writeFunc() {
    const data='\n***************\n나는 별이야\n제일빛나\n***************';
    try {
        await fsPromises.writeFile('./you.txt', readData+data);
    } catch (err) {
        console.error(err);
    }
})();
