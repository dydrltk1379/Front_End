<template>
    <div>
        <h3>emits-methods 기반 사용자 이벤트 핸들러 연동예제</h3>
        <div> - component에서 이벤트 발생시 외부에서 이벤트를 관리하기 위한 핸들러 지원 </div>
        <div> - component 내에서는 emits를 활용하여 외부에서 이벤트를 처리</div>
        <div> - https://ko.vuejs.org/guide/components/events</div>
        <hr><br>
        
        <InputName @nameChanged="nameChangedHandler" />
        <br/>
        <h3>App 데이터 : {{ parentName }}</h3>
    </div>
</template>

<script>
import InputName from './components/InputName.vue'
export default {
    name: "App4",
    components: { InputName },
    data() {
        return { parentName: "" }
    },
    methods: {
        nameChangedHandler(e) {
            this.parentName = e.name;
        }
    }
}
</script>
