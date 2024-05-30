<template>
    <div>
        <h3>2. watch를 통한 stata 변화감지</h3>
        x : <input type="text" v-model.number="state.x"><br>
        결과 : {{ state.result }}
    </div>
</template>

<script setup>
import {reactive, watch} from 'vue';

const state = reactive({x:0, result:0});
watch(()=>state.x, (current, old)=>{
    alert('old : ' + old + ', current :' + current);
    state.result = current *2;
});

</script>