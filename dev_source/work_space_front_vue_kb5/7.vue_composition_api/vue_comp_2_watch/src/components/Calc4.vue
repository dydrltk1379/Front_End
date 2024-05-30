<template>
    <div>
        <h3>4. watchEffect ★★★★★</h3>
        <div> - 이전 값 모니터링이 필요없고 단순 변경감지가 필요할 때 활용</div>
        x : <input type="text" v-model.number="x"><br>
        y : <input type="text" v-model.number="y"><br>
        <div>result : {{ result }}</div>
    </div>
</template>

<script setup>
import {ref, watchEffect} from 'vue';

const x = ref(10);
const y = ref(20);
const result = ref(30);
watchEffect(()=>{
    result.value = x.value + y.value;
});

</script>