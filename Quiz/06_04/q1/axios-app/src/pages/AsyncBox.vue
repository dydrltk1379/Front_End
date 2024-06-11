<template>
    <div class="container">
        <h2>Async Box</h2><br>
        <div v-html="result"></div>
    </div>
</template>

<script setup>
import axios from 'axios';
import {ref} from 'vue';

const todolistURL = "/api/todolist/gdhong";
const result = ref('');

const requestAPI = async () => {
    try {
        const response1 = await axios.get(todolistURL);
        result.value = '# TodoList : ' + JSON.stringify(response1.data)+ '<br><br>';
        console.log('# TodoList : ', response1.data)
    } catch (error) {
        alert('요청 에러 발생 !');
        console.log(error);
    }
}

requestAPI();
</script>