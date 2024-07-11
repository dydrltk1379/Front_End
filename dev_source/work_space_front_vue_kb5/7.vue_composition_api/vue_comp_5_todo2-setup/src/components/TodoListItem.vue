<template>
    <!-- todoItem 객체의 completed 속성에 따라 클래스를 동적으로 추가 -->
    <li class="list-group-item" 
        :class="{ 'list-group-item-success': todoItem.completed }"
        @click="emit('toggle-completed', todoItem.id)" >
        
        <!-- todoItem 객체의 completed 속성에 따라 스타일을 동적으로 추가 -->
        <span class="pointer" :class="{ 'todo-done': todoItem.completed }">
            {{ todoItem.todo }} {{ todoItem.completed ? "(완료)" : "" }}
        </span>
        
        <!-- 삭제 버튼 -->
        <span class="float-end badge bg-secondary pointer"
            @click.stop="emit('delete-todo', todoItem.id)">삭제</span>
    </li>
</template>

<script setup>
    // props 정의: todoItem prop은 객체 형태로, 필수로 전달되어야 함
    const props = defineProps({
        todoItem: { type: Object, required: true }
    });

    // emit 함수 정의: 부모 컴포넌트로 이벤트를 발생시키기 위한 함수들을 정의
    const emit = defineEmits(['delete-todo', 'toggle-completed']);
</script>