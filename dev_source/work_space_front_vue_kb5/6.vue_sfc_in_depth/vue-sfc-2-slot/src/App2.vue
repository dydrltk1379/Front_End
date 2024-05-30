<template>
    <!-- slot을 통해 레이아웃을 구성하는 방법 -->
    <!-- https://v3-docs.vuejs-korea.org/guide/components/slots.html#named-slots -->
    <!--Layout 선언-->
    <Layout>
        <!-- 사용자가 정의한 slot이 작성되는 영역-->
        <template v-slot:header>
            <h2>헤더 영역</h2>
        </template>
        <template v-slot:sidebar>
            <h3>사이드</h3>
            <h3>사이드</h3>
            <h3>사이드</h3>
        </template>
        <template v-slot:default>
            <h1>컨텐츠 영역1</h1>
            <h1>컨텐츠 영역2</h1>
            <h1>컨텐츠 영역3</h1>
            <h1>컨텐츠 영역4</h1>
            <h1>컨텐츠 영역5</h1>
            <h1>컨텐츠 영역6</h1>
        </template>
        <template v-slot:footer>
            <h2>Footer text</h2>
        </template>
    </Layout>
</template>
<script>
import Layout from './components/Layout.vue'
export default {
    name:'app2',
    components:{Layout}
}
</script>