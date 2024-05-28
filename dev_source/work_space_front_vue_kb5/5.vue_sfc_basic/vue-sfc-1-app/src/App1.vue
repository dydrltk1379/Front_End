<template>
    <div>
        <h2>props 연동예제1</h2><br>
        <div> - props란? 외부 layout에서 components로 필요한 속성이나 인자를 전달하는 값</div>
        <div> - 해당 예제는 필요한 props를 모두 하나씩 선언하여 components로 전달하는 방법</div>
        <div> - component 설계시 가장 표준적으로 활용, 의존성이 없이 단독으로 컴포넌트 설계 가능</div>
        <div> - -> 결론 : 의존성은 낮아지고, 재사용성/가독성 향상된다!</div>
        <br>
        <div> - 의존성이란? https://engineering.linecorp.com/ko/blog/code-readability-vol4</div>
        <div> - https://ko.vuejs.org/guide/components/props</div>
        <div> - https://ko.vuejs.org/guide/components/props#prop-validation</div>
        <hr><br>

        <h2>관심있는 K-POP 가수?</h2>
        <hr />
        <ul>
            <!-- key : 특수 속성 key는 Vue의 가상 DOM 알고리즘이 
            이전 목록과 새 노드 목록을 비교할 때 vnode를 식별하는 힌트
            for문 사용시 무조건 넣어야한다!!!! -->
            <!-- props를 전달하는 과정, v-bind를 통해 :id="idol.id" 식으로 전달한다.-->
            <CheckboxItem1 v-for="item in idols" :key="item.id"
                            :id="item.id" :name="item.name" :checked="item.checked"/>
        </ul>
    </div>
</template>

<script>
// sfc
import CheckboxItem1 from './components/CheckboxItem1.vue'
export default {
    name:'App',
    components:{CheckboxItem1},
    data(){
        return {
            idols: [
                { id: 1, name: "BTS", checked: true },
                { id: 2, name: "Black Pink" },
                { id: 3, name: "EXO" },
                { id: 4, name: "ITZY" },
            ]
        }
    }
}
</script>
