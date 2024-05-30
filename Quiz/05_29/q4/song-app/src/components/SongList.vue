<template>
    <ul>
        <SongListItem v-for="item in songs" :key="item.id" :song="item"/>
    </ul>
    <div>체크된 곡의 수 : {{doneCount}}</div>
</template>

<script>
import SongListItem from './SongListItem.vue'
export default{
    name:'SongList',
    components:{
        SongListItem
    },
    props:['songs'],
    inject:['doneCount'],
}
</script>