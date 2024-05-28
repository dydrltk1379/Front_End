<template>
    <div>
        <h3>props 연동예제3</h3>
        <div> - props에 대한 인자를 class로 선언하여 인자를 넘기는 방법 </div>
        <div> - props에 대한 정의를 외부 파일로 선언하면 의존성이 증가하고 복잡해진다.</div>
        <div> - 가능하면 props 형태로 컴포넌트 내부에 가지고 있는것이 좋다.</div>
        <hr><br>
        
        <h2>관심있는 K-POP 가수?</h2>
        <hr />
        <ul>
            <CheckboxItem v-for="idol in idols" :idol="idol" />
        </ul>
    </div>
</template>

<script>
import CheckboxItem from './components/CheckboxItem3.vue'
import Idol from './Idol';
export default {
    name: "App3",
    components: {
        CheckboxItem
    },
    data() {
        return {
            idols: [
                new Idol(1, "BTS", true),
                new Idol(2, "Black Pink", false),
                new Idol(3, "EXO", false),
                new Idol(4, "ITZY", false),
            ]
        }
    }
}
</script>