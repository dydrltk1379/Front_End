<template>
  <div class="container">
      <!-- Header 컴포넌트를 포함한 상단 영역 -->
      <Header />
      
      <!-- 현재 라우터에 의해 렌더링된 컴포넌트를 표시하는 영역 -->
      <router-view />
      
      <!-- 데이터 로딩 중일 때 보여지는 로딩 컴포넌트 -->
      <Loading v-if="isLoading" />
  </div>
</template>

<script setup>
import Header from '@/components/Header.vue' // Header 컴포넌트 가져오기
import Loading from '@/components/Loading.vue' // Loading 컴포넌트 가져오기
import { computed } from 'vue'; // Vue Composition API에서 computed 함수 가져오기
import { useTodoListStore } from '@/stores/todoList.js' // TodoList 상태 관리 스토어 가져오기

const todoListStore = useTodoListStore(); // TodoList 상태 관리 스토어 인스턴스 생성

// 상태 관리 스토어에서 로딩 상태를 가져오는 computed 속성
const isLoading = computed(() => todoListStore.isLoading);

// 상태 관리 스토어에서 Todo 리스트를 가져오는 함수 호출
const fetchTodoList = todoListStore.fetchTodoList;
fetchTodoList(); // 초기 Todo 리스트 데이터 로딩 요청
</script>