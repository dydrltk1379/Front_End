<template>
    <div>
        요트 수량 : <input type="text" v-model.number="cnt"><br>
        요트 가격 : <input type="text" v-model.number="money"><br>
        <button @click="onCick">요트 주문 가격 비교</button><br>
        요트 이전 계산 주문 가격 : {{ oMoney }}원<br>
        요트 현재 계산 주문 가격 : {{ cMoney }}원<br>
        가격 차이 : {{ diffMoney }}원<br>
    </div>
</template>

<script setup>
import {ref, watch} from 'vue'

const cnt=ref(0);
const money=ref(0);
const oMoney=ref(0);
const cMoney=ref(0);
const comp=ref(0);
const onClick=()=>{
    comp.value = cnt * money * 2;
}

watch(comp, (current, old)=>{
    oMoney.value=old;
    cMoney.value=current;
    diffMoney.value = Math.abs(oMoney.value - cMoney.value);
}
    
</script>
