<template>
    <div class="child">
        <h2>Child2 - .child로 style영역에 다시 선언한 부분(cyan)</h2>
    </div>
</template>

<script>
export default {
    name : "Child2"
}
</script>

<style>
/*<style> : 전역 스타일, 다른 css도 영향을 미친다.*/
.child { background-color: cyan; border:solid 1px black; margin:1em; padding: 1.0em;  }
</style>
