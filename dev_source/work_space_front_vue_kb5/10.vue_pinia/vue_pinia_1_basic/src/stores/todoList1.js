import { defineStore } from "pinia";
import { reactive, computed } from 'vue';

// 옵션 API 방식의 todoList1 스토어
export const useTodoList1Store = defineStore("todoList1", {
    state : () => ({ 
        todoList : [
            { id: 1, todo: "ES6학습",  done: false },
            { id: 2, todo: "React학습",  done: false },
            { id: 3, todo: "ContextAPI 학습",  done: true },
            { id: 4, todo: "야구경기 관람", done: false },
        ] 
    }),
    getters : {
        doneCount : (state)=> {
            return state.todoList.filter((todoItem)=>todoItem.done === true).length;
        }
    },
    actions : {
        addTodo(todo) {
            this.todoList.push({ id: new Date().getTime(), todo, done: false })
        },
        deleteTodo(id) {
            let index = this.todoList.findIndex((todo) => todo.id === id);
            this.todoList.splice(index, 1);
        },
        toggleDone(id) {
            let index = this.todoList.findIndex((todo) => todo.id === id);
            this.todoList[index].done = !this.todoList[index].done;
        }
    }
})