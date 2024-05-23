const fs = require('fs').promises;

/*
let files = fs.readdir("./", (err, files)=>{
    if(err){
        console.error(err);
    }
    console.log(files);
});
*/

/*
fs.readdir("./")
.then((result)=>console.log(result))
.catch((err)=>console.error(err));
*/
(async function readFunc(){
    try {
        const data = await fs.readdir('./');
        console.log(data);     
    } catch (err) {
        console.error(err);
    }
})();

console.log("Code is done"); 