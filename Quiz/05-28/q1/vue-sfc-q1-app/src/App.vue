<template>
  <div id="app" class="container">
    <div>
      <ImageBox />
      <TableBox :todoList="todoList"/>
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
  data(){
    return{
      todoList:[
        {todoName:'kim baby', todoAge:1, todoGender:'woman'}
      ]
    }
  }
}
</script>