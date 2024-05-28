<template>
    <div style="border:solid 1px black; margin:5px; padding:5px;">
        <h2>Sender</h2><hr>
        <button @click="sendMessage">이벤트 발신</button>
    </div>
</template>

<script>
export default{
    name:'Sender',
    methods:{
        sendMessage(){
            // https://www.npmjs.com/package/mitt?activeTab=readme#examples--demos
            // emit : Invoke all handlers for the given type
            // 인자1 : type, (string | symbol) The event type to invoke
            // 인자2 : evt, Any? Any value (object is recommended and powerful), 
            //         passed to each handler
            this.emitter.emit('message', Date.now() + '에 발신된 메시지'); 
            // 다른 핸들러에서 메세지를 발생시킬때 활용
        }
    }
}

</script>