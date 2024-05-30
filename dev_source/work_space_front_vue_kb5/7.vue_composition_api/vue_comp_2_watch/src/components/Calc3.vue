<template>
    <div>
        <h3>3. watch를 통해 여러 변수(x, y의 변화 감지하는 방법)</h3>
        x : <input type="text" v-model.number="x"><br>
        y : <input type="text" v-model.number="y"><br>
        <div>result : {{ result }}</div>
    </div>
</template>

<script setup>
import {ref, watch} from 'vue';

const x = ref(10);
const y = ref(20);
const result = ref(30);
watch([x, y], ([currentX, currentY],[oldX, oldY])=>{
    if (currentX !== oldX) console.log(`X : ${oldX} ==> ${currentX}`)
    if (currentY !== oldY) console.log(`Y: ${oldY} ==> ${currentY}`)
    result.value = currentX + currentY;
});

</script>