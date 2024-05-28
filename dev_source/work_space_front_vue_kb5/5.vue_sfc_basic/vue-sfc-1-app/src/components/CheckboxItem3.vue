<template>
    <li>
        <input type="checkbox" :checked="idol.checked"> {{ idol.id }} - {{ idol.name }} 
    </li>
</template>


<script>
import Idol from '../Idol.js';
export default {
    name: 'CheckboxItem3',
    props: {
        idol: Idol,
    }
}
</script>