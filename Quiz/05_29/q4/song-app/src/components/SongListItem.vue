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
    inject : ['icons'],
}
</script>