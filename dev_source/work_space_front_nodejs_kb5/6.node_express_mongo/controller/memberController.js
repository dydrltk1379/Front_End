const asyncHandler = require("express-async-handler");
const Member = require("../model/memberModel");
const bcrypt = require("bcrypt");


const registerMemberPage = asyncHandler(async (req, res) => {
    res.status(200).render('memberRegister');
});

const registerMember = asyncHandler(async (req, res) => {
    let member = req.body;
    console.log(member);
    // 파라미터 체크부
    const {memberid, password, membername} = member; 
    if(!memberid || !password || !membername){
        // 필수 파라미터가 들어 오지 않았을때!
        const model = {result:false, reason:'입력값이 부족합니다.'};
        return res.status(200).render('memberRegisterResult', model);
    } 


    const hashedPassword = await bcrypt.hash(member.password, 10);
    member.password = hashedPassword;

    // Db insert 코드부
    try {
        const newMember = await Member.create(member);
        console.log(newMember);
        if(newMember == null){
            // 필수 파라미터가 들어 오지 않았을때!
            const model = {result:false, reason:'DB 에러.'};
            return res.status(200).render('memberRegisterResult', model);
        }
    } catch (err) {
        // 필수 파라미터가 들어 오지 않았을때!
        const model = {result:false, reason:'아이디 중복'};
        return res.status(200).render('memberRegisterResult', model);
    }
    // 정상 패턴!!
    // 필수 파라미터가 들어 오지 않았을때!
    const model = {result:true, member};
    return res.status(200).render('memberRegisterResult', model);
    

    res.json(member);
});

const getAllMemberList = asyncHandler(async (req, res) => {
    const memberList = await Member.find();
    console.log(memberList);
    res.status(200).render('memberList', {memberList});
});

module.exports = {
    registerMemberPage, 
    registerMember,
    getAllMemberList,
}