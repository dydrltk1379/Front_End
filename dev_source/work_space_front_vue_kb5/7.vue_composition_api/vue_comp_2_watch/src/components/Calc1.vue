<template>
    <div>
        <h3>1. watch를 통한 단일인자 변화 감지 방법</h3>
        <div> - watch 변화가 감지되면 old, new 값을 동시에 처리할 수 있는 매커니즘</div>
        x : <input type="text" v-model.number="x"><br>
        <div>결과 : {{result}}</div>
    </div>
</template>

<script setup>
import {ref, watch} from 'vue';

const x = ref(0);
const result = ref(0);
watch(x, (current, old) => {
    alert('old : ' + old + ', current :' + current);
    result.value = current * 2;
});

</script>