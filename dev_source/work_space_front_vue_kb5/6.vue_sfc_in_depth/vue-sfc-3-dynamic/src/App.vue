<template>
    <div class="container">
        <h2>동적 컴포넌트(keep-alive)</h2>
        <div> - 여러 컴포넌트 간에 동적으로 전환될 때, 컴포넌트를 조건부로 캐시할 수 있는 방법</div>
        <div> - keep-alive를 활용하여 component의 :is를 v-bind하여 컴포넌트를 바꿀수 있음</div>
        <div> - https://v3-docs.vuejs-korea.org/guide/built-ins/keep-alive.html</div>
    </div>
    <hr><br><br>

    <div class="container">
        <h1 class="headerText">태평양 전쟁의 해전</h1>
        <nav>
            <ul class="nav nav-tabs nav-fill">
                <li v-for="tab in tabs" :key="tab.id" class="nav-item">
                    <a style="cursor:pointer" class="nav-link"
                        :class="{active : tab.id === currentTab}"
                        @click="changeTab(tab.id)">
                        {{ tab.label }}
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="container">
        <!-- :is = 컴포넌트를 동적으로 바꿔주는 키워드-->
        <!-- keep-alive : 캐시할수 있는 기능-->
        <!-- <keep-alive include="MidwayTab, CoralSeaTab"> -->
        <!-- 버전 3.2.34부터 sfc의 name 옵션을 자동으로 추론, 이름을 수동으로 선언할 필요-->
        <keep-alive>
            <component :is="currentTab"></component>
        </keep-alive>
    </div>
</template>
<script>
import CoralSeaTab from './components/CoralSeaTab.vue'
import LeyteGulfTab from './components/LeyteGulfTab.vue'
import MidwayTab from './components/MidwayTab.vue'

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
