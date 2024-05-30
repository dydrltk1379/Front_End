<template >
    <div>
        <input type="checkbox" :value="id" :checked="checked"
            @change="$emit('check-changed', {id, checked: $event.target.checked})">
        <!-- 외부에서 주입된 slot이 들어갈자리-->
        <slot>Item</slot>
    </div>
</template>

<script>
export default {
    name : "CheckBox2",
    props : ["id", "checked"]
}
</script>