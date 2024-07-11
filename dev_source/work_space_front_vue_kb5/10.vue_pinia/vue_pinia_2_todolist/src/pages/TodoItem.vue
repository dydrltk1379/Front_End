<template>
  <li :class="todoItem.done ? 'list-group-item list-group-item-success' : 'list-group-item'">

    <!-- 할일 항목이 완료되었을 때, 클래스를 추가하여 완료 상태를 시각적으로 표시합니다 -->
    <span :class="todoItem.done ? 'todo-done pointer' : 'pointer'"
      @click="toggleDone(todoItem.id)">
      <!-- 할일 내용을 표시하고, 완료 상태에 따라 완료 표시를 추가합니다 -->
      {{todoItem.todo}}
      {{todoItem.done ? '(완료)' : '' }}
    </span>

    <!-- 편집 버튼을 클릭하면 해당 할일의 ID를 포함한 URL로 라우팅합니다 -->
    <span class="float-end badge bg-secondary pointer m-1" 
      @click="router.push(`/todos/edit/${todoItem.id}`)">
      편집
    </span>
    
    <!-- 삭제 버튼을 클릭하면 해당 할일을 삭제합니다 -->
    <span class="float-end badge bg-secondary pointer m-1" 
      @click="deleteTodo(todoItem.id)">
      삭제
    </span>
  </li>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useTodoListStore } from '@/stores/todoList.js'

// vue3 함수 : props로 전달된 todoItem 객체의 타입을 명시합니다
defineProps({
  todoItem: { type: Object, required: true }
})

// Vue Router와 할일 목록 관리를 위한 store를 사용합니다
const router = useRouter();
const todoListStore = useTodoListStore();
const { deleteTodo, toggleDone } = todoListStore;
</script>