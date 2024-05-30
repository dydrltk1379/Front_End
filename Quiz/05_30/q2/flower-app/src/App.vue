<template>
  <div>
    <h3>FLOWER ORDER</h3>
    <FlowerBox/>
  </div>
</template>

<script>
import FlowerBox from './components/FlowerBox.vue';
export default{
  name:'app',
  components:{FlowerBox}
}
</script>