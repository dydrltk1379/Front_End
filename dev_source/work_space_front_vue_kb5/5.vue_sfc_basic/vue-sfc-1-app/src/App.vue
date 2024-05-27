<template>
  <div>
    <h2> Component란? </h2>
    <div> - 사용자와 상호작용하는 기본적인 형태로 기능을 수행할 수 있는 최소한의 단위</div>
    <div> - 중요한 속성은 재사용으로 특정 영역에서만 사용하지 않도록 용도를 명확하게 정의</div>
    <div> - 컴포넌트는 색, 텍스트, 아이콘 등을 이용하여 시각적으로 적절하게 구성</div>
    <div> - Vue의 컴포넌트는 페이지에 렌더링할 엘리먼트이며, 작고 재사용 가능한 코드 조각</div>
    <div> - 외부 layout과 상호작용이 가능하며 props, emits 또는 piana를 활용 </div>
    <div> - props : 외부에서 Component로 인자를 넘길 때는 속성값을 통해 전달하는 기능</div>
    <div> - emits : Component에서 event 발생시 handler 전달하기 위해 method 인자</div>
    <div> - piana : Component/Page 간에 상태를 공유를 위한 외부 미들웨어 (성능 + 보안이점)</div>

    <div>https://deep-wide-studio.tistory.com/96</div>
    <div>https://www.lgcns.com/blog/cns-tech/cloud/48514/</div>
    <div>https://ko.vuejs.org/api/sfc-spec.html</div>
    <hr /><br>

    <ul>
      <CheckboxItem />
      <CheckboxItem />
      <CheckboxItem />
      <CheckboxItem />
    </ul>
  </div>
</template>

<script>
import CheckboxItem from './components/CheckboxItem.vue'
export default {
  name: "App",
  components: {
    CheckboxItem
  },
}
</script>

<style scoped></style>