<template>
    <div>
        컴포넌트1 입니다.
        <button @click="onClick">클릭!!</button><br>
        count : {{ count }}
    </div>
</template>


<script setup>
import { ref, onBeforeMount, onMounted, onUpdated, onUnmounted } from 'vue';
 
const count = ref(0);

const onClick = (e)=>{
    count.value++;
}

onBeforeMount(() => {
  alert('Component1 - onBeforeMount')
});

onMounted(() => {
  alert('Component1 - onMounted')
});

onUpdated(() => {
  alert('Component1 - onUpdated')
});

onUnmounted(() => {
  alert('Component1 - onUnmounted')
});
</script>
