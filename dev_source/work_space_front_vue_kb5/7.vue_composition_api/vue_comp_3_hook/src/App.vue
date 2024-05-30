<template>
    <div>
        <h3>컴포지션 API: 생명주기 hook**</h3>
        <div> - lifecycle hooks : 생명주기에 따라 호출되는 함수들을 의미(hooks=>갈고리 의미)</div>

        <div> - onMounted : VDOM이 DOM으로 모두 렌더링 된 이후에 호출되는 함수
            <br>-> 사용자의 화면 업데이트가 가능한 시점으로 해당 시점 이후로 ajax처리를 수행한다.</div>

        <div> - onUpdated : 반응형 상태 변경으로 컴포넌트의 DOM 트리가 업데이트된 후 호출
            <br>-> |화면의 변화가 발생한 시점|으로 해당 기능으로 업데이트를 감지해도 된다. (watchEffect 동일 기능)
        </div>

        <div> -  onUnmounted : 컴포넌트가 마운트 해제된 후 호출될 콜백
            <br>-> 화면이 내려간 시점으로 특정 ui를 삭제하거나 통신을 끊을때 활용
        </div>
        <div>https://ko.vuejs.org/guide/essentials/lifecycle</div>
        <div>https://ko.vuejs.org/api/composition-api-lifecycle.html</div>
        <hr><br><br>

        <button @click="changeComponent(Component1)">Component1</button>
        <button @click="changeComponent(Component2)">Component2</button>
        <component :is="selectComp"></component>
    </div>
</template>

<script setup>
import { ref, onBeforeMount, onMounted, onUpdated, onUnmounted, watchEffect } from 'vue';
import Component1 from "./components/Component1.vue";
import Component2 from "./components/Component2.vue";

const selectComp = ref(Component1); // 벌써부터 변경 -> watchEffect
const changeComponent = (comp)=>{
    selectComp.value = comp;
};

onBeforeMount(()=>{
    alert('App - onBeforeMount');
});
onMounted(()=>{
    alert('App - onMounted');
});
onUpdated(()=>{
    alert('App - onUpdated');

});
watchEffect(()=>{
    alert('App - watchEffect');
});
onUnmounted(()=>{
    alert('App - onUnmounted');

});
</script>