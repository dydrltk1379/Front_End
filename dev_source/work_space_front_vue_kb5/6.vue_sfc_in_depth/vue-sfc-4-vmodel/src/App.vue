<template>
  <div>
    <h2>Component v-model통한 컴포넌트간 양방향 바인딩</h2>
    <div>- 부모와 자식간의 이벤트트 발생시 양방으로 바인딩하는 방법</div>
    <div>- emit기반으로 양방향으로 전파 가능하지만, 과정이 복잡하다.</div>
    <div>- mitt 기반으로 이벤트를 연동하는 것이 더 유리</div>
    <div>https://v3-docs.vuejs-korea.org/guide/components/v-model.html</div>
    <hr><br>
    
    <InputName v-model:name="searchName" />
    <h3> 검색어 : {{searchName}}</h3> 
  </div>
</template>

<script>
import InputName from './components/InputName.vue';

export default {
  name : "App",
  components : { InputName },
  data() {
    return { searchName : "John" }
  },
  methods : {
    changeSearchName(name) {
      console.log(name)
      this.searchName = name;
    }
  }
}
</script>