<template>
  <div id="app" class="container">
    <div class="card card-default card-borderless">
      <div class="card-body"> 
        <ImageBox />
        <TableBox :todoList="todoList"/>
      </div>
    </div>
  </div>
</template>

<script>
import TableBox from './components/TableBox.vue'
import ImageBox from './components/ImageBox.vue'

export default{
  name:'app',
  components:{
    TableBox,
    ImageBox
  },
}
</script>