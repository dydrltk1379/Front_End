<template>
    <li>
       <input type="checkbox" :checked="checked"/> {{ id }} - {{ name }} 
    </li>
</template>
<script>
export default{
    // 해당 설계가 가장 이상적인 component props 설계!
    // 가급적 해당 방법으로 component를 설계하길 권장!
    // https://ko.vuejs.org/guide/components/props#prop-validation
    name:'CheckboxItem1',
    // props : 외부에서 받아온 인자(속성값)
    props1:{
        // 1. props 기본 선언형
        id:Number,
        name:String, 
        checked:Boolean,
        // 한번에 여러 type으로 활용할수 있도록 선언하는 방법
        id2:[Number, String],
    },
    props:{
        // 2. 객체 선언형 -> 가장 표준적으로 활용됨 + 기본 선언형
        // type : 사용할 객체의 type
        // required : 필수 여부
        // default : 값이 없을 경우의 기본 값
        id:{
            type:Number,
            required:true,
        },
        name:{
            // validator : 양식 검사용, true로 리턴할때는 성공, false로 리턴할경우는 실패.
            validator(v){
                return typeof(v) !== 'string' ?
                false : v.trim().length >= 4 ? true : false;
            }
        }, 
        checked:{
            type:Boolean,
            required:false,
            default:false,
        },
    }
}
</script>