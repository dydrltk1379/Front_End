<template>
    <div class="container">
        <h2 class="my-3">List 예제</h2>
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr class="table-dark text-white">
                    <th>번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>성별</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in json">
                    <td>{{item.id}}</td>
                    <td>{{item.first_name}} {{item.last_name}}</td>
                    <td>{{item.email}}</td>
                    <td>{{item.gender}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<script setup>
import json from '@/MOCK_DATA.json'
</script>