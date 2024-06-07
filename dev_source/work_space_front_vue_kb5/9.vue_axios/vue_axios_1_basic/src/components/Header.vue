<template>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark mt-2">
        <span class="navbar-brand">Axios</span>
        <button class="navbar-toggler" type="button" @click="changeIsNavShow">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div :class="navClass">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <router-link class="nav-link" to="/">홈</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page1">Page1</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page2">Page2</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page3">Page3</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page4">Page4</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page5">Page5</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page6">Page6</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page7">Page7</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/Page8">Page8</router-link>
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