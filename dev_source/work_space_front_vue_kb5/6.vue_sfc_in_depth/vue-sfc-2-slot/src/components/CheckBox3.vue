<template>
    <div>   
        <!--named slot 가져오는 방법-->
        <slot name="icon"></slot>
        <input type="checkbox" :value="id" :checked="checked"
            @change="$emit('check-changed', {id, checked: $event.target.checked})">
        <slot name="label"></slot>
    </div>
</template>
<script>
export default {
    name:'CheckBox3',
    props:['id', 'checked'],
}
</script>