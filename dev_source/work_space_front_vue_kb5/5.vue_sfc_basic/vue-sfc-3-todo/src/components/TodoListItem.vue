<template>
    <li class="list-group-item" 
        :class="{ 'list-group-item-success': completed } "
        @click="$emit('toggle-completed', id)" >
        <span class="pointer" :class="{ 'todo-done': completed }">
            {{todo}} {{ completed ? "(완료)" : "" }}
        </span>
        <span class="float-end badge bg-secondary pointer"
            @click.stop="$emit('delete-todo', id)">삭제</span>
    </li>
</template>

<script>
    export default {
        name : "TodoListItem",
        props : {
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
        },
        emits : ["delete-todo", "toggle-completed"], 
    }
</script>