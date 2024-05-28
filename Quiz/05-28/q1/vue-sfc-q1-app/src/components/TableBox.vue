<template>
    <div>
        <table>
            <tr>
                <td>name</td>
                <td>{{ todoList.todoName }}</td>
            </tr>
            <tr>
                <td>age</td>
                <td>{{ todoList.todoAge }}</td>
            </tr>
            <tr>
                <td>gender</td>
                <td>{{ todoList.todoGender }}</td>
            </tr>
        </table>
    </div>
</template>
<script>
import TodoList from '../../../../../../dev_source/work_space_front_vue_kb5/5.vue_sfc_basic/vue-sfc-3-todo/src/components/TodoList.vue';

export default{
    name:'TableBox'
    ,props:{
        todoList:{
            id : {
                type : Number,
                required: true
            },
            todo : {
                type : String,
                required: true
            },
            completed : { 
                type : Boolean, 
                required: false,
                default : false 
            },
            
        }
    }
}
</script>