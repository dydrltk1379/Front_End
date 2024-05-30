<template>
  <Person/>
</template>

<script>
import Person from './components/Person.vue'

export default{
  name : 'app',
  components:{Person},
  set(){
    const nameObj = useName("smith");
    const calCObj = useCalc(100, 200)

    return {...nameObj, calCObj};
  }
}
</script>