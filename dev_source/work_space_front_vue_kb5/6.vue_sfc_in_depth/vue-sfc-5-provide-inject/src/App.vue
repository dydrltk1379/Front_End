<template>
  <div>
    <h2>Provide(제공) / Inject(주입)</h2>
    <div> - Props Drilling 이슈 : 컴포넌트가 복잡해지면 props를 하위로 전달하는 것이 어려움</div>
    <div> - 부모자식 뿐만 아니라 조상-자식간의 props를 전달하고, 받아 올 방법을 제공 </div>
    <div> - provide() : 하위 컴포넌트에서도 사용할 속성 지정(등록)</div>
    <div> - inject() : 미리 등록된 속성 주입해서 사용</div>
    <div> - https://v3-docs.vuejs-korea.org/guide/components/provide-inject.html </div>
    <hr><br>

    <h2>최신 인기곡</h2>
    <SongList :songs="songs"/>
    <hr><br><br>

    <h2>Teleport</h2>
    <div> - 일반적으로 모달, 툴팁이라고 부르는 팝업형태의 UI를 구성하는 방법</div>
    <div> - https://v3-docs.vuejs-korea.org/api/built-in-components.html#teleport</div>
    <hr><br>

    <button @click="changeModal">Teleport를 활용한 Modal 기능</button>
    <teleport to='#modal'>
      <Modal v-if="isModal"></Modal>
    </teleport>
  </div>
</template>

<script>
import { computed } from 'vue';
import SongList from './components/SongList.vue'
import Modal from './components/Modal.vue'

export default {
  name: 'App',
  components: { SongList, Modal },
  data() {
    return {
      songs: [
        { id: 1, title: "Blueming", done: true },
        { id: 2, title: "Dynamite", done: true },
        { id: 3, title: "Lovesick Girls", done: false },
        { id: 4, title: "마리아(Maria)", done: false },
      ],
      isModal: false,
    }
  },
  methods:{
    changeModal(){
      this.isModal = true;
      setTimeout(()=>{this.isModal = false}, 2000);
    }
  },

  // 하위 컴포넌트에 전달할 인자
  provide() {
    return {
      icons: {
        checked: "far fa-check-circle",
        unchecked: "far fa-circle",
      },
      // 하위 컴포넌트에서 업데이트 될 값
      doneCount: computed(()=>{
        return this.songs.filter((s) => s.done === true).length;
      })
    }
  }

}
</script>
<style>
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css");
</style>
