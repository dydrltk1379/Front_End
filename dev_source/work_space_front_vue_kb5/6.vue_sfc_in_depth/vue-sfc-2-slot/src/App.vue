<template>
  <div>
    <h2>Slot</h2>
    <div> - Slot이란? 미리 작성된 컴포넌트를 다른 컴포넌트로 주입(inject)하는 방법</div>
    <div> - 작동 원리는 props에 컴포넌트를 전달하여 특정 영역을 전달받은 컴포넌트로 구성</div>
    <div> - props 기준으로 컴포넌트를 설계하는 것이 일반적이다.</div>
    <div> - slot은 주로 layout을 미리 잡은 형태나 alert창, list 구성시에 가끔 활용</div>
    <div> - https://v3-docs.vuejs-korea.org/guide/components/slots.html</div>
    <hr><br>
  
    <NoSlotTest/><br>
    <SlotTest/><br>
    <NamedSlotTest/><br>
    <ScopedSlotTest/>
  </div>
</template>

<script>
import NoSlotTest from './components/NoSlotTest.vue'
import SlotTest from './components/SlotTest.vue'
import NamedSlotTest from './components/NamedSlotTest.vue'
import ScopedSlotTest from './components/ScopedSlotTest.vue'

export default {
  name:'App',
  components :{NoSlotTest, SlotTest, NamedSlotTest,ScopedSlotTest}
}
</script>
