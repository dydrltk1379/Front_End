<template>
    <div>
        꽃이름 입력 : <input type="text" v-model="flowerName"><br>
        꽃 가격 : <input type="text" v-model.number="money"><br>
        꽃 수량 : <input type="text" v-model.number="cnt"><br>
        <button>주문</button><br>
        {{ flower }}의 가격은 {{ result }}입니다.
        
    </div>
</template>

<script setup>
import {ref, watch, computed} from 'vue';

const money=ref(0);
const cnt=ref(0);
const result = ref(0);
watch([money, cnt], ([currentM, currentC],[oldM, oldC])=>{
    result.value = currentM * currentC * 2;
    flower=flwoerName;
});
</script>