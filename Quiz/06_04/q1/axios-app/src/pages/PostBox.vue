<template>
    <div class="container">
        <h2>Post Box</h2>
        <button @click="requestAPI">요청</button><br>
        <div> 응답 : <span v-html="result"></span></div>
    </div>
</template>

<script setup>
import axios from "axios";
import { ref } from 'vue';
const result = ref('');

const requestAPI = async () => {
    try {
        const url = "/api/todolist_long/gdhong";
        let data = { todo: "윗몸일으키기 3세트", desc: "너무 빠르지 않게..." };

        const response = await axios.post(url, data);
        result.value = JSON.stringify(response.data);
        console.log(response.data);
    } catch (error) {
        alert('에러 발생 !');
        console.log('# error : ', error)
    }
};
</script>