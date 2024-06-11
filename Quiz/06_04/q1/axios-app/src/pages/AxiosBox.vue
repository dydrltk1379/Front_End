<template>
    <div class="container">
        <h2>Axios Box</h2><br>
        <div v-html="result"></div>
    </div>
</template>

<script setup>
import axios from 'axios';
import {ref} from 'vue';

const todolistURL = "/api/todolist/gdhong";
const todoUrlPrefix = "/api/todolist/gdhong/";
const result = ref('');

const requestAPI = async () => {
    let todoList = [];

    axios
        .get(todolistURL)
        .then((response1) => {
            todoList = response1.data;
            result.value = '# TodoList : ' + JSON.stringify(todoList)+ '<br><br>';
            console.log('# TodoList : ', todoList);
            return todoList[0].id;
        })
        .then((id) => {
            return axios.get(todoUrlPrefix + id);
        })
        .then((response2) => {
            result.value += '## 첫번째 Todo : ' + JSON.stringify(response2.data) + '<br>';
            console.log('# 첫번째 Todo : ', response2.data);
            return todoList[1].id;
        })
        .then((id) => {
            axios.get(todoUrlPrefix + id).then((response) => {
                result.value += '## 두번째 Todo : ' + JSON.stringify(response.data) + '<br>';
                console.log("## 두번째 Todo : ", response.data);
            });
        })
        .chatch((e) => {
            alert('요청 에러 발생 !');
            console.log(error);
        })
}

requestAPI();
</script>