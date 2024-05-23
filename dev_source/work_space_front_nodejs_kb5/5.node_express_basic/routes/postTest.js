const asyncHandler = require("express-async-handler");
const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");

router.get("/post_page", (req, res) => {
  res.status(200).render("post_page");
});

// post 처리 방법
// req.body에 요청된 데이터가 존재한다.
const registerMember = asyncHandler(async (req, res) => {
  // console.log(req);
  // console.log(req.body);
  let member = req.body;
  // passwode 암호화
  const hashedPassword = await bcrypt.hash(member.pw, 10);
  member.pw = hashedPassword;
  console.log(member);
  res.render('result.ejs', {member});
  // res.json(member); // json으로 리턴하는 방법

});

router.route("/post_result").post(registerMember);

module.exports = router;
