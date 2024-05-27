<template>
    <!-- template : html을 작성하는 영역, vue의 속성을 활용할 수 있다. -->
    <li>
        <input type="checkbox" v-model="checked" /> 
        <span class="test"> 옵션1</span>
    </li>
</template>

<!-- <script setup> -->
<!-- https://ko.vuejs.org/api/sfc-script-setup -->

<script>
    // script 영역이 작성되는 곳
    export default {
        name : "CheckboxItem",
        data() {
            return {
                checked: false
            };
        }
    }
</script>

<style scoped>
    /* style scoped */
    /* css를 적용 가능한 영역 */
    /* 가능하면 사용하지 말고, css 파일에 정의하는 것이 일반적 */
    .test {
        color: blue;
    }
</style>