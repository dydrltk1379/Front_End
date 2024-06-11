<template>
    <div>
        <h2>콘솔 확인 - 전체 검색, 첫번째 Todo 검색, 두번째 Todo 검색</h2>
    </div>
</template>
  
<script setup>
import axios from 'axios';

const listUrl = "/api/todolist_long/gdhong";
const todoUrlPrefix = "/api/todolist_long/gdhong/";

const requestAPI = async () => {
  try {
    let response = await axios.get(listUrl);
    let todoList = response.data;
    console.log("# TodoList : ", todoList);

    const finishIndex = Math.min(2, todoList.length - 1);
    for (let i = 0; i < finishIndex; i++) {
      response = await axios.get(todoUrlPrefix + todoList[i].id);
      console.log(`# ${i + 1}번째 Todo : `, response.data);
    }
  } catch (e) {
    console.error('# error : ', e);
  }
};

requestAPI();
</script>