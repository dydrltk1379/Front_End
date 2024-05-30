<template>
    <div>
        <h3>1. setup() 기반 composition 활용법</h3>
        <div>- vue 3부터 활용 가능한 문법으로 기존 문법보다 편리하게 활용가능</div>
        <div>- export default 기반으로 setup()를 활용하는 방법</div>
        <div>- 기존 sfc와 달리 반응형으로 사용할 변수를 ref로 활용해야 한다.</div>
        <div>- https://v3-docs.vuejs-korea.org/api/reactivity-core.html</div>
        <br>
        x : <input type="text" v-model.number="x"><br>
        y : <input type="text" v-model.number="y"><br>
        <button @click="calcAdd">계산</button>
        <div>결과 : {{result}}</div>
    </div>

</template>
<script>
import {ref} from 'vue';

export default {
    name:'Calc1',
    setup(props) {
        // ref : 전달된 값을 갖게 되고, .value가 있는 변경 가능한 반응형 ref 객체를 반환
        const x = ref(10);
        // x = 20; // 이런 문법은 안된다!
        // x.value = 20;
        const y = ref(20);
        const result = ref(x.value + y.value);
        const calcAdd = ()=>{
            result.value = x.value + y.value;
        }
        // setup의 리턴값은 내부에서 참조한 모든 변수를 return해야한다.
        // -> return한 값 기준으로 mount될때 templeat으로 전달된다.
        return {x, y, result, calcAdd};
    }
}
</script>