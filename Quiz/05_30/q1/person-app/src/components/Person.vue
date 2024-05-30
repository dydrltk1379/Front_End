<template>
    <div>
        name : <br> <input type="text" v-model="name" class="form-control mt-2" @change="ChangeName"><br>
        x : <br><input type="text" v-model.number="x" class="form-control mt-2" @change="ChangeX"><br>
        y : <br><input type="text" v-model.number="y" class="form-control mt-2" @change="ChangeY"><br>
        <hr>
        name : <span class="badge text-bg-danger p-3">{{ name }}</span><br>
        x : <span class="badge text-bg-primary p-3">{{ x }}</span><br>
        y : <span class="badge text-bg-info p-3">{{ y }}</span><br>
    </div>
</template>

<script>
import {reactive, computed, onMounted} from 'vue';

const useName = (name = 'john') =>{
    const nameData = reactive({name : ""})
    const changeName = (name) =>{
        nameData.name = name.trim().length < 2 ? "" : name.trim();
    } 
    onMounted(() => nameData.name = 'john');
    return {nameData, changeName};
}
const useCalac = (x=0, y=0)=>{
    const calcData = reactiv({x:0, y:0});
    const result = computed(()=>
        parseInt(calData.x, 10) + parseInt(calData.y, 10));
    onMounted(()=>{
        calcData.x = 10;
        calcData.y = 20;
    })
    const changeX = (strX)=>{
        let x = parseInt(strX, 10);
        calcData.x = isNaN(x) ? 0 : x;
    }
    const changeY = (strY)=>{
        let y = parseInt(strY, 10);
        calcData.y = isNaN(Y) ? 0 : Y;
    }
    return {calcData, changeX, changeY};
}
</script>
