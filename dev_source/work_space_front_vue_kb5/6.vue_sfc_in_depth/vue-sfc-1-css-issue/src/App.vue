<template>
  <div>
    <h2>css scope 이슈 </h2>
    <div> style : 전역 스타일, 다른 css도 영향을 미친다. </div>
    <div> style scoped : 로컬 스타일, 선언한 로컬 영역만 영향을 받는다 </div>
    <div> style module : 빌드가 되고, CSS 정보를 vue 내부에서 활용 가능 -> scoped와 같음</div>
    <div> 결론 : style scoped를 사용하지 말고 정통적인 css를 적용 방법이 제일 편리하다!</div>
    <div> https://vuejs.org/api/sfc-css-features.html</div>
    <hr><br>
    
    <Child1 />
    <Child2 />
    <Child3 />
    <Child4 />
    <Child5 />
  </div>
</template>

<script>
import Child1 from './components/Child1.vue';
import Child2 from './components/Child2.vue';
import Child3 from './components/Child3.vue';
import Child4 from './components/Child4.vue';
import Child5 from './components/Child5.vue';

export default {
  name: "App",
  components: { Child1, Child2, Child3, Child4, Child5 }
}
</script>
