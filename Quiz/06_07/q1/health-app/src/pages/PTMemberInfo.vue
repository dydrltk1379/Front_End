<template>
    <div>
        <h1> PT 이용 회원 정보</h1>
        회원 ID :  {{member_id}}<br>
        회원 PW :  {{member_pw}}<br>
        회원 이름 :  {{member_name}}<br>
        회원 주소 :  <span class="box">{{member_addr}}</span><br>
        회원 전화 :  <span class="box">{{member_tel}}</span><br>
    </div>
</template>

<script setup>
import { useMemberStore } from '@/stores/Member.js';
import { storeToRefs } from 'pinia';

const MemberStore = useMemberStore();
const { member_id, member_pw, member_name, member_addr, member_tel } = storeToRefs(MemberStore);

</script>

<style>
h1{
    background-color: blue;
    border: 1px solid black;
}

.box{
    background-color: blue;
    border: 1px solid white;
    display: inline-block; 
    width: 190px; 
}
</style>