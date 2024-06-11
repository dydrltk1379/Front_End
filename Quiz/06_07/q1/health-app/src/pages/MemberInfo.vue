<template>
    <div>
       <h1 class="title"> 헬스장 이용 회원 정보</h1>
       회원 ID :  {{member_id}}<br>
       회원 PW :  {{member_pw}}<br>
       회원 이름 :  {{member_name}}<br>
       회원 주소 :  <input type="text" class="box1" v-model="member_addr"><br>
       회원 전화 :  <input type="text" class="box1" v-model="member_tel"><br>
    </div>
</template>

<script setup>
import { useMemberStore } from '@/stores/Member.js';
import { storeToRefs } from 'pinia';

const MemberStore = useMemberStore();
const { member_id, member_pw, member_name, member_addr, member_tel } = storeToRefs(MemberStore);

</script>

<style>
.title{
    background-color: green;
    border: 1px solid black;
}

.box1{
    background-color: green;
    border: 1px solid white;
}
</style>