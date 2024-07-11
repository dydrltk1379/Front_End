<template>
    <div class="container">
        <div class="row">
            <div class="col p-3">
                <h2>할일 수정</h2>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label htmlFor="todo">할일:</label>
                    <input type="text" class="form-control" id="todo" v-model="todoItem.todo" />
                </div>
                <div class="form-group">
                    <label htmlFor="desc">설명:</label>
                    <textarea class="form-control" rows="3" id="desc" v-model="todoItem.desc"></textarea>
                </div>
                <div class="form-group">
                    <label htmlFor="done">완료여부 : </label>&nbsp;
                    <input type="checkbox" v-model="todoItem.done" />
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary m-1" @click="updateTodoHandler">
                    수 정
                    </button>
                    <button type="button" class="btn btn-primary m-1" @click="router.push('/todos')">
                    취 소
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { reactive } from 'vue'; // Vue Composition API에서 reactive 함수 가져오기
import { useRouter, useRoute } from 'vue-router'; // Vue Router의 useRouter, useRoute 함수 가져오기
import { useTodoListStore } from '@/stores/todoList.js'; // TodoList 상태 관리 스토어 가져오기

// Vue Router를 사용하기 위해 초기화
const router = useRouter();
const currentRoute = useRoute();

// TodoList 상태 관리 스토어에서 필요한 기능 가져오기
const { todoList, updateTodo } = useTodoListStore();

// 현재 경로의 파라미터(id)에 해당하는 할일 항목 가져오기(찾기)
const matchedTodoItem = todoList.find((item) => item.id === parseInt(currentRoute.params.id));
if (!matchedTodoItem) {
    // 매칭된 할일 항목이 없으면 TodoList 페이지로 이동
    router.push('/todos');
}

// 반응형 : 할일 항목을 reactive 객체로 변환
const todoItem = reactive({ ...matchedTodoItem });

// 할일 수정 핸들러 함수 정의
const updateTodoHandler = () => {
    let { todo } = todoItem;
    // 할일이 입력되지 않았을 경우 경고 메시지 출력
    if (!todo || todo.trim() === "") {
        alert('할일은 반드시 입력해야 합니다');
        return;
    }
    // 할일 업데이트 메서드 호출 및 완료 후 TodoList 페이지로 이동
    updateTodo({ ...todoItem }, () => {
        router.push('/todos');
    });
}
</script>