<template>
    <div>
        <Calc1></Calc1>
        <hr><br>
    </div>
    <div>
        <Calc2 :defaultX="50" :defaultY="80" v-model="calcResult"
                @myCalcEvent="myCalcEvent"></Calc2>
        calcResult : {{ calcResult }}
        <hr><br>
    </div>
    <div>
    <Calc3></Calc3>
        <hr><br>
    </div>
    <div>
    <Calc4></Calc4>
        <hr><br>
    </div>
</template>

<script>
import Calc1 from './components/Calc1.vue';
import Calc2 from './components/Calc2.vue';
import Calc3 from './components/Calc3.vue';
import Calc4 from './components/Calc4.vue';

export default {
    name:'App',
    components:{Calc1, Calc2, Calc3, Calc4},
    data(){
        return {calcResult:0};
    },
    methods:{
        //사용자 이벤트
        myCalcEvent(value){
            alert(value);
        }
    }
}
</script>