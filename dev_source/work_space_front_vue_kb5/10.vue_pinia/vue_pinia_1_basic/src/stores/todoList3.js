import { defineStore } from "pinia";
import { ref, computed } from 'vue';

// 컴포지션 API 방식의 todoList3 스토어
export const useTodoList3Store = defineStore("todoList3", () => {
    const todoList = ref([
        { id: 1, todo: "ES6학습", done: false },
        { id: 2, todo: "React학습", done: false },
        { id: 3, todo: "ContextAPI 학습", done: true },
        { id: 4, todo: "야구경기 관람", done: false },
    ])

    const addTodo = (todo) => {
        todoList.value.push({ id: new Date().getTime(), todo, done: false })
    }

    const deleteTodo = (id) => {
        let index = todoList.value.findIndex((todo) => todo.id === id);
        todoList.value.splice(index, 1);
    }

    const toggleDone = (id) => {
        let index = todoList.value.findIndex((todo) => todo.id === id);
        todoList.value[index].done = !todoList.value[index].done;
    }

    const doneCount = computed(() => {
        return todoList.value.filter((todoItem) => todoItem.done === true).length;
    })

    return { todoList, doneCount, addTodo, deleteTodo, toggleDone };
})