<template>
    <!-- 여기서부터 공부해도 된다. -->
    <div>
        <h3>2. script setup 기반 composition 활용법 ★★★★★</h3>
        <div> - SFC 내에서 컴포지션 API를 더 쉽게 활용하기 위한 컴파일 타임 문법</div>
        <div> - SFC에서 컴포지션 API를 사용하는 경우, 권장되는 문법</div>
        <div> - **defineProps() : 부모에서 선언한 props를 가져올수 있는 매크로</div>
        <div> - **defineEmits() : 부모에서 선언한 emit(사용자 이벤트)를 가져올수 있는 매크로</div>
        <div> - **defineModel() : 부모에서 선언한 model값을 가져올수 있는 매크로</div>
        <div>https://ko.vuejs.org/api/sfc-script-setup.html#basic-syntax</div>
        <br>
        x : <input type="text" v-model.number="x"><br>
        y : <input type="text" v-model.number="y"><br>
        <button @click="calcAdd">계산</button>
        <div>결과 : {{result}}</div>
    </div>
</template>

<!-- script setup : default export를 생략하고 순수 setup 영역으로 선언되는 곳-->
<script setup> // 자바 스크립트 영역으로 바뀐다.
import {ref} from 'vue';

// <Calc2 :defaultX="50" :defaultY="80"></Calc2>
const props = defineProps({
    defaultX : {
        type:Number,
        required: true,
    },
    defaultY : {
        type:Number,
        required: true,
    },
});

// 부모로부터 선언된 model 가져오는 방법
const model = defineModel({

});

const x = ref(props.defaultX);
const y = ref(props.defaultY);
const result = ref(x.value + y.value);
model.value = result.value;

// 부모가 선언한 사용자 이벤트(emit) 가져오는 방법
const emit = defineEmits(['myCalcEvent']); // myCalcEvent : 이벤트 타입

const calcAdd = (e)=>{
    result.value = x.value + y.value;
    model.value = result.value;
    emit('myCalcEvent', result.value); // 부모가 정의한 이벤트로 전달하는 코드
}


// return 생략 가능!
</script>