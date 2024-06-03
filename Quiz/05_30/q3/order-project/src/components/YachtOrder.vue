<template>
    <div>
        요트 수량 : <input type="number" v-model.number="state.cnt"> <br>
        요트 가격 : <input type="number" v-model.number="state.x"> <br>
        <button @click="displayInfo">요트 주문 가격 비교</button>
        <div v-if="state.infoDisplayed">
            <div>
                <p>요트 이전 주문 가격 : {{ state.prevPrice }}</p>
            </div>
            <div>
                <p>요트 현재 주문 가격 : {{ state.currentPrice }}</p>
            </div>
            <div>
                <p>가격 차이 : {{ state.price }}</p>
            </div>
        </div>
    </div>
</template>

<script setup>
import { reactive } from 'vue';

const state = reactive({
    cnt: 0,
    x: 0,
    prevPrice: 0,
    currentPrice: 0,
    price: 0,
    infoDisplayed: false
});

const displayInfo = () => {
    state.prevPrice = state.currentPrice;
    state.currentPrice = state.cnt * state.x;
    state.price = state.currentPrice - state.prevPrice;
    state.infoDisplayed = true;
};

</script>
