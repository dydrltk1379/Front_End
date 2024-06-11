<template>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark mt-2 p-2 ps-4">
        <span class="navbar-brand">Axios</span>
        <button class="navbar-toggler" type="button" @click="changeIsNavShow">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div :class="navClass">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <router-link class="nav-link" to="/">AxiosBox</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/AsyncBox">AsyncBox</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/PostBox">PostBox</router-link>
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