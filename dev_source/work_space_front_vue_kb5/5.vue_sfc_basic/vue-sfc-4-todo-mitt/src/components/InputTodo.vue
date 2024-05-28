<template>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="할일을 여기에 입력!"
                v-model.trim="todo" @keyup.enter="addTodoHandler"/>
        <button class="btn btn-primary input-group-addon"
                @click="addTodoHandler">추가</button>
    </div>
</template>
<script>
export default {
    name:'IntputTodo',
    data(){
        return {todo: ''}
    },
    methods: {
        addTodoHandler(){
            if(this.todo.length < 3){
                alert('3글자 이상 입력이 필요합니다.');
                return;
            }
            this.emitter.emit('add-todo', this.todo);
            this.todo = '';
        }
    },
}
</script>