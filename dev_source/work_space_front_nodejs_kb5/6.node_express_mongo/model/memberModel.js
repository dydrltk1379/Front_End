const mongoose = require('mongoose');

// mongoose 스키마 가져오기
const Schema = mongoose.Schema;

// 사용자 스키마 생성
const MemberSchema = new Schema({
    memberid:{
        type:String, // 데이터 type, 몽고DB에서 사용할  type
        require:true, // 필수 값
        unique:true, // 중복여부
    },
    password:{
        type:String, // 데이터 type, 몽고DB에서 사용할  type
        require:true, // 필수 값
    },
    membername:{
        type:String, // 데이터 type, 몽고DB에서 사용할  type
        require:true, // 필수 값
    },
    age:{
        type:Number, // 데이터 type, 몽고DB에서 사용할  type
        require:false, // 필수 값 아님!
    },
    address:{
        type:Number, // 데이터 type, 몽고DB에서 사용할  type
        require:false, // 필수 값 아님!
    },
});

// Member 모델을 만들고 내보냅니다.
module.exports = mongoose.model("Member", MemberSchema);