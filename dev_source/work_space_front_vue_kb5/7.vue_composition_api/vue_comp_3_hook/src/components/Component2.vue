<template>
    <div>
        컴포넌트2 입니다.
        {{ test }}
    </div>
</template>
<script setup>
import { ref, onBeforeMount, onMounted, onUpdated, onUnmounted } from 'vue';
 
const test = ref('컴포넌트2 Test Text!');

onBeforeMount(() => {
  alert('Component2 - onBeforeMount')
});

onMounted(() => {
  alert('Component2 - onMounted')
});

onUpdated(() => {
  alert('Component2 - onUpdated')
});

onUnmounted(() => {
  alert('Component2 - onUnmounted')
});
</script>