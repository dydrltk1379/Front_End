<template>
    <div class="child">
        <h2>Child3 - .child로 style scoped영역에 선언한 부분(burlywood)</h2>
    </div>
</template>

<script>
export default {
    name : "Child3"
}
</script>

<style scoped>
/*<style scoped> : 로컬 스타일, 해당 영역만 영향을 받는다.*/
.child { background-color: burlywood; border:solid 1px black; margin:1em; padding: 1.0em;  }
</style>
