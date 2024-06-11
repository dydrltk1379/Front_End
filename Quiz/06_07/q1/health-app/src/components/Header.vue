<template>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark p-2">
        <span class="navbar-brand">Pinia</span>
        <button class="navbar-toggler" type="button" @click="changeIsNavShow">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div :class="navClass">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <router-link class="nav-link" to="/">홈</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/memberinfo">헬스장 이용 회원 정보</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/ptmemberinfo">PT 이용 회원 정보</router-link>
                </li>
            </ul>
        </div>
    </nav>
</template>

<script setup>
import { reactive, computed } from 'vue';
import { RouterLink } from 'vue-router';

const state = reactive({ isNavShow: false });

const navClass = computed(() => state.isNavShow
    ? "collapse navbar-collapse show" : "collapse navbar-collapse")

const changeIsNavShow = () => {
    state.isNavShow = !state.isNavShow;
};

// return { state, changeIsNavShow, navClass };
</script>