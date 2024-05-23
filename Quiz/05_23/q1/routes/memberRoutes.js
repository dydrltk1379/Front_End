const express = require("express");
const asyncHandler = require('express-async-handler');
const router = express.Router();
const bcrypt = require("bcrypt");

router.get('/login', (req, res)=>{
    res.status(200).render('login');
});

router.get('/info', (req, res)=>{
    res.status(200).render('info');
});

router.get('/position', (req, res)=>{
    res.status(200).render('position');
});


module.exports = router;
