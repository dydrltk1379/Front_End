<template>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark mt-2">
        <span class="navbar-brand">이날치(LeeNalChi)</span>
        <button class="navbar-toggler" type="button" @click="changeIsNavShow">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div :class="navClass">
            <ul class="navbar-nav"> 
                <li class="nav-item">
                    <!-- router-link : 라우트 페이지를 이동(리렌더링)시키기 위한 명령어-->
                    <!-- 일반 페이지에서 a-link와 같은 기능! -->
                    <router-link class="nav-link" to="/">홈</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/about">소개</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" 
                        to="/param?param1=test1&param2=test2">
                        Param
                    </router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/members">멤버</router-link>
                </li>
                <li class="nav-item">
                    <router-link class="nav-link" to="/videos">영상</router-link>
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