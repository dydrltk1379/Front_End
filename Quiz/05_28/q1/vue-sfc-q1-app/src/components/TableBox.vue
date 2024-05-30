<template>
    <div>
        <table :class="tableStyle">
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
export default{
    name:'TableBox'
    ,data(){
        return{
            todoList:{
                todoName:'kim baby', todoAge:1, todoGender:'woman'
            }
        }
    },
}
</script>