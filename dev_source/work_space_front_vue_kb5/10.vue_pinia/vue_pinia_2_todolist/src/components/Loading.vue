<template>
    <!-- VueCsspin 컴포넌트를 사용하여 로딩 메시지와 스타일을 지정합니다. -->
    <VueCsspin message="Loading" spin-style="cp-flip" />
</template>

<script setup>
import { VueCsspin } from 'vue-csspin'; // vue-csspin에서 VueCsspin 컴포넌트 가져오기
import 'vue-csspin/dist/vue-csspin.css'; // vue-csspin의 CSS 파일을 임포트합니다.
</script>