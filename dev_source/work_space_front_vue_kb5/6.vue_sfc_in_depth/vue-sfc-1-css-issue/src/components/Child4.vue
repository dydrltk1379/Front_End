<template>
    <div :class="$style.child">
        <h2>Child4 - .child로 style module영역에 선언한 부분(orange)</h2>
    </div>
</template>

<script>
export default {
    name : "Child4",
    created() {
        console.log(this.$style);
    },
}
</script>

<style module>
/*<style module> : css가 빌드가 되고, vue에서 활용할수 있는 데이터로 넘어옴
                  -> 부가효과=scoped같은 효과 발생!*/
.child { background-color: orange; border:solid 1px black; margin:1em; padding: 1.0em;  }
</style>
