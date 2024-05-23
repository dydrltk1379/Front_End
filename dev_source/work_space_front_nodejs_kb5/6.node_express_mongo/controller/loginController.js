const asyncHandler = require("express-async-handler");
const Member = require("../model/memberModel");
const bcrypt = require("bcrypt");

const loginPage = asyncHandler(async (req, res) => {
  return res.status(200).render("memberLogin");
});

const login = asyncHandler(async (req, res) => {
  let member = req.body;
  let loginMember;

  const { memberid, password } = member;

  if (!memberid || !password) {
    return res.status(200).render("memberLoginResult", { result: false });
  }

  try {
    const query = { memberid: member.memberid };
    loginMember = await Member.findOne(query);
    console.log(loginMember);

    if (loginMember == null) {
      const model = { result: false, reason: "DB 에러" };
      return res.status(200).render("memberLoginResult", model);
    }
    const cmpResult = await bcrypt.compare(password, loginMember.password);
    // member.password = hashedPassword;
    if (cmpResult == false) {
      const model = { result: false, reason: "비밀번호가 맞지 않습니다." };
      res.status(200).render("memberLoginResult", model);
    }
  } catch (err) {
    const model = { result: false, reason: "DB Error!" };
    return res.status(200).render("memberRegisterResult", model);
  }

  // 성공 라인 세션에 값을 넣는 방법
  req.session.loginMember = loginMember;
  console.log(req.session.loginMember);
  const model = { result: true, loginMember };
  res.status(200).render("memberLoginResult", model);
});

const logout = asyncHandler(async (req, res) => {
    req.session.destroy((err) => {
    if (err) {
        console.log(err);
    }});
  return res.redirect('/'); // redirect : 페이지 이동
});

module.exports = { loginPage, login, logout };
