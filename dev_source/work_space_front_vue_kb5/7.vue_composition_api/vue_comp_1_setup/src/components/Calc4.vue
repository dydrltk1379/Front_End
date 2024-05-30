<template>
    <div>
        <h3>4. computed</h3>
        <div> - 계산값을 캐시할수 있는 기능 </div>
        <div> - https://ko.vuejs.org/api/reactivity-core.html#computed</div>
        <br>
        x : <input type="text" v-model.number="state.x"><br>
        y : <input type="text" v-model.number="state.y"><br>
        <button @click="calcAdd">계산</button>
        <div>결과 : {{result}}</div>
        <div>결과 : {{result}}</div>
        <div>결과 : {{result}}</div>
        <div>결과 : {{result}}</div>
        <div>결과 : {{result}}</div>
        <div>결과 : {{result}}</div>
        <div>결과 : {{result}}</div>
    </div>
    
</template>

<script setup>
import {reactive, computed} from 'vue';

const state = reactive({x:10, y:20});
const result = computed(()=>{
    alert('Run result!');
    return state.x + state.y;
});

</script>