// router기반으로 코드를 모듈화하는 방법

const express = require("express");
const asyncHandler = require('express-async-handler');
const router = express.Router();
const bcrypt = require("bcrypt");

router.get('/get_page', (req, res)=>{
    res.status(200).render('get_page');
});

// express-async-handler 기반으로 비동기 처리하는 방법 
// 
const registerMemer = asyncHandler(async (req, res)=>{
    console.log(req);
    console.log(req.query);
    let member = req.query;

    // password 암호화 + await 처리 방법
    const hashedPassword = await bcrypt.hash(member.pw, 10);
    member.pw = hashedPassword
    console.log(member);
    res.render('result.ejs', {member});

    // res.json(member);
});

router.route('/get_result').get(registerMemer);

module.exports = router;