<template>
    <!-- 부모 컴포넌트에서 전달받은 todoList를 순회하며 각 항목을 TodoListItem 컴포넌트로 렌더링 -->
    <div class="row">
        <div class="col">
            <ul class="list-group">
                <!-- v-for 디렉티브를 사용하여 todoList 배열을 순회하면서 각 todoItem을 TodoListItem 컴포넌트로 렌더링 -->
                <!-- todoList 배열을 순회 -->
                <!-- Vue에서 v-for를 사용할 때 각 요소에 고유한 key를 지정하여 효율적인 렌더링을 도와줌 -->
                <!-- TodoListItem 컴포넌트에서 delete-todo 이벤트 발생 시 부모 컴포넌트에 todoItem.id를 전달하여 처리 -->
                <!-- TodoListItem 컴포넌트에 todoItem prop으로 전달 -->
                <!-- TodoListItem 컴포넌트에서 toggle-completed 이벤트 발생 시 부모 컴포넌트에 todoItem.id를 전달하여 처리 -->
                <TodoListItem 
                    v-for="todoItem in todoList" 
                    :key="todoItem.id"  
                    :todoItem="todoItem" 
                    @delete-todo="emit('delete-todo', todoItem.id)"  
                    @toggle-completed="emit('toggle-completed', todoItem.id)"  
                />
            </ul>
        </div>
    </div>
</template>

<script setup>
// TodoListItem.vue 파일을 TodoListItem 컴포넌트로 import
import TodoListItem from './TodoListItem.vue' 

// 부모 컴포넌트에서 전달받은 props를 정의
const props = defineProps({
    // todoList prop은 배열 형태로, 필수로 전달되어야 함
    todoList: { type: Array, required: true }  
});

// 컴포넌트에서 발생시키는 이벤트들을 정의
const emit = defineEmits(['delete-todo', 'toggle-completed']);
</script>