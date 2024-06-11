<template>
    <div>
        <h2>콘솔 확인 - gdhong이 작성한 글 검색</h2>
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

    for (let i = 0; i < todoList.length - 1; i++) {
      response = await axios.get(todoUrlPrefix + todoList[i].id);
      
      console.log(`# ${i + 1}번째 작성한 글 : `, {
                    todo : response.data.todo,
                    desc : response.data.desc
                });
    }
  } catch (e) {
    console.error('# error : ', e);
  }
};

requestAPI();
</script>