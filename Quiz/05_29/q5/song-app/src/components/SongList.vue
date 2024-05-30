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
    // inject : 상위 컴포넌트에서 값을 가져올때 (부모+조상)
    inject:['doneCount'],
}
</script>