<template>
    <li>
        <i :class="song.done ? icons.checked : icons.unchecked">
                {{song.id}} - {{song.title}}
        </i>
    </li>
</template>
<script>
export default {
    name:'SongListItem',
    props:['song'],
    // inject : 상위 컴포넌트(부모+조상)로 받아올 값
    inject : ['icons'],
}
</script>