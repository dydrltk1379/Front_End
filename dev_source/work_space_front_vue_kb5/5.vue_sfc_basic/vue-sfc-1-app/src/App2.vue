<template>
  <div>
    <h3>props 연동예제2</h3>
    <div> - idol이라는 객체 형태로 components로 props로 전달하는 방법</div>
    <div> - 사용하는 객체에 대한 정보를 코드를 작성한 인원 외에는 파악이 어렵다. </div>
    <div> - 가독성과 재사용성을 떨어지는 방법으로 사용하지 않길 권장 </div>
    <hr><br>
    
    <h2>관심있는 K-POP 가수?</h2>
    <hr />
    <ul>
      <CheckboxItem v-for="idol in idols" :key="idol.id" :idol="idol" />
    </ul>
  </div>
</template>

<script>
import CheckboxItem from './components/CheckboxItem2.vue'
export default {
  name: "App2",
  components: { CheckboxItem },
  data() {
    return {
      idols: [
        { id: 1, name: "BTS", checked: true },
        { id: 2, name: "Black Pink", checked: false },
        { id: 3, name: "EXO", checked: false },
        { id: 4, name: "ITZY", checked: false },
      ]
    }
  }
}
</script>