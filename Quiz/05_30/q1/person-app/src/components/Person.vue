<template>
    <div>
        name : <input type="text" v-model="name"> <br>
        키(x) : <input type="text" v-model.number="x"> <br>
        Y(몸무게) : <input type="text" v-model.number="y"> <br>
        <button @click="displayInfo">정보표시</button>
        <div v-if="infoDisplayed">
            <p>입력된 정보:</p>
            <p>이름: {{ name }}</p>
            <p>키: {{ x }}</p>
            <p>몸무게: {{ y }}</p>
        </div>
    </div>
</template>

<script setup>
import { ref, watch } from 'vue';

const name = ref('');
const x = ref(null);
const y = ref(null);
const infoDisplayed = ref(false);
const info = ref({ name: '', x: null, y: null });

const displayInfo = () => {
    infoDisplayed.value = true;
    info.value = { name: name.value, x: x.value, y: y.value };
};

watch([name, x, y], (newValues, oldValues) => {
    console.log('입력된 정보:', newValues);
});

</script>
