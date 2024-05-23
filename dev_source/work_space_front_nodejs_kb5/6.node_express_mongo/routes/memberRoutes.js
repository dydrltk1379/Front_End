const express = require("express");
const router = express.Router();

const {
  registerMemberPage,
  registerMember,
  getAllMemberList,
} = require("../controller/memberController");

const {
  loginPage,
  login,
  logout,
} = require("../controller/loginController");

router.route("/member_regist").get(registerMemberPage).post(registerMember);
router.route("/member_list").get(getAllMemberList);
router.route("/login").get(loginPage).post(login);
router.route("/logout").get(logout).post(logout);

module.exports = router;
