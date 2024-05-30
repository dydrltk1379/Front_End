<template>
    <div class="child">
        <h2>Child1 - .child로 style영역에 선언한 부분(yellow)</h2>
    </div>
</template>

<script>
export default {
    name : "Child1"
}
</script>

<style>
/*<style> : 전역 스타일, 다른 css도 영향을 미친다.*/
.child { background-color: yellow; border:solid 1px black; margin:1em; padding: 1.0em;  }
</style>
