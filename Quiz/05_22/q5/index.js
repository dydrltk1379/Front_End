const fs=require('fs');
const path=require('path');

const index = (req, res)=>{
    res.setHeader('Content-Type', 'text/html');
    const htmlPath = path.join(__dirname, 'assets', 'index.html');
    const rs = fs.createReadStream(htmlPath, 'utf-8');
    rs.pipe(res);
}

module.exports = index;