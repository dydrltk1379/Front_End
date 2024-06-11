<template>
    <div>
        <h2>콘솔 확인 - data키에 있는 데이터를 post방식으로 전송</h2>
    </div>
</template>

<script setup>
import axios from "axios";

const requestAPI = async () => {
    try {
        const url = "/api/todolist_long/gdhong";
        let data = { todo: "윗몸일으키기 3세트", desc: "너무 빠르지 않게..." };
        const resp1 = await axios.post(url, data);
        console.log(resp1.data);
    } catch (e) {
        console.error('# error : ', e);
    }
};

requestAPI();
</script>