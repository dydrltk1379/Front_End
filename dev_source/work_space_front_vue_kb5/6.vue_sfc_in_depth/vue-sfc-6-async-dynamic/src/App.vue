<template>

  <div class="container"> 
    <h2>비동기 컴포넌트</h2>
    <div> - 렌더링될 때 지연 로드되는 비동기 컴포넌트를 정의</div>
    <div> - 인자는 로더 함수이거나 로드 동작의 고급 제어를 위한 옵션 객체</div>
    <div>https://v3-docs.vuejs-korea.org/api/general.html#defineasynccomponent</div>
  </div>
  <div class="container">
    <h1 class="headerText">태평양 전쟁의 해전</h1>
    <nav>
      <ul class="nav nav-tabs nav-fill">
        <li v-for="tab in tabs" :key="tab.id" class="nav-item">
          <a style="cursor:pointer;" class="nav-link" 
            :class="{ active : tab.id === currentTab }"
            @click="changeTab(tab.id)">{{tab.label}}</a>
        </li>
      </ul>
    </nav>
  </div>
  <div>
    <component :is="currentTab" />
  </div>
</template>
<script>
import { defineAsyncComponent } from 'vue'
import pMinDelay from 'p-min-delay'
import Loading from './components/Loading.vue';

const CoralSeaTab = defineAsyncComponent({
  loader : () => pMinDelay(import('./components/CoralSeaTab.vue'), 2000),
  loadingComponent : Loading,
})
const LeyteGulfTab = defineAsyncComponent({
  loader : () => pMinDelay(import('./components/LeyteGulfTab.vue'), 2000),
  loadingComponent : Loading,
})
const MidwayTab = defineAsyncComponent({
  loader : () => pMinDelay(import('./components/MidwayTab.vue'), 2000),
  loadingComponent : Loading,
})

export default {
  name: 'App',
  components : { CoralSeaTab, LeyteGulfTab, MidwayTab },
  data() {
    return { 
      currentTab : 'CoralSeaTab',
      tabs : [ 
        { id:"CoralSeaTab", label:"산호해 해전" }, 
        { id:"MidwayTab", label:"미드웨이 해전" }, 
        { id:"LeyteGulfTab", label:"레이테만 해전" }
      ] 
    }
  },
  methods : {
    changeTab(tab) {
      this.currentTab = tab;
    }
  }
}
</script>
<style>
.header { padding: 20px 0px 0px 20px; }
.headerText { padding: 0px 20px 40px 20px; } 
.tab { padding: 30px }
</style>
