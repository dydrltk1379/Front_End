<template>
    <div class="container mt-3">
        <h2>Pinia basic</h2>
        <div> - 공식 홈페이지 양식대로 활용한 예제</div>
        <div> - 새로고침(F5)를 수행하면 pinia 저장소 초기화됨</div>
        <div> - https://pinia.vuejs.org/core-concepts/#Setup-Stores</div>
        <hr />

        이름 : {{ name }} <br>
        count : {{ count }} <br>
        doubleCount : {{  doubleCount }} <br>
        <button @click="increment">addCount</button>
        <button @click="reset">초기화</button>
        <hr><br>
        name : <input type="text" v-model.trim="inputName"><br>
        age : <input type="text" v-model.number="inputage"><br>
        address : <input type="text" v-model.trim="inputAddress"><br>
        <button @click="addMember">추가</button>
        <hr>
        <ul>
            <li v-for="item in list" :key="item.name">
                {{ item.name }}, {{ item.age }}, {{ item.address }}
            </li>
        </ul>
    </div>
</template>

<script setup>
import { useSimpleStore } from '@/stores/simpleStore.js'
import { storeToRefs } from 'pinia'
import { ref } from 'vue';

const simpleStore = useSimpleStore();
// 구조분할
const {count, name, list, doubleCount} = storeToRefs(simpleStore); // ref를 제대로 가져오는 방법
const {increment, addList, reset} = simpleStore; // 메소드 + 컴모넌트

const inputName = ref('홍길동');
const inputage = ref(31);
const inputAddress = ref('서율시 강남구 역삼동');

const addMember = (e)=>{
    const member = {
        name:inputName.value,
        age:inputage.value,
        address:inputAddress.value,
    };
    inputName.value="";
    inputage.value="";
    inputAddress.value="";
    addList(member);
}

</script>