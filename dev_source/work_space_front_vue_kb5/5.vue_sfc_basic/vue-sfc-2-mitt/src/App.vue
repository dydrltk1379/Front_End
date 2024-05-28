<template>
  <div>
      <h3>mitt 기반 components 이벤트 관리 예제</h3>
      <div>- 외부 라이브러리인 mitt 기반으로 이벤트 핸들러를 설계할수 있다. </div>
      <div>- 기존 emit기반 이벤트를 처리하는 경우 컴포넌트 부모 자식간에 의존성이 발생!</div>
      <div>- 또한 부모-자식-자식 등의 여러 컴포넌트를 거치는 경우 emit 전달이 복잡하다.</div>
      <div>- mitt은 컴포넌트 간의 의존성을 줄일수 있도록 설계됨 </div>
      <div>- https://www.npmjs.com/package/mitt</div>
      <hr><br>

      <Sender />
      <hr />
      <Receiver />
  </div>
</template>

<script>
  import Receiver from './components/Receiver.vue'
  import Sender from './components/Sender.vue'
  export default {
      name : "App",
      components : { Sender, Receiver }
  }
</script>