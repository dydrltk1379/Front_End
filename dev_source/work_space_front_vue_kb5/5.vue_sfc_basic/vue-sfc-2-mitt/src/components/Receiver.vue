<template>
    <div style="border:solid 1px black; margin:5px; padding:5px;">
        <h2>Receiver</h2>
        <hr>
        <h2> 전송된 텍스트 : {{textMessage}}</h2>
    </div>
</template>

<script>
export default{
    name:'Receiver',
    // 해당 vue가 생성될때 호출되는 메소드
    created() {
        // on : Register an event handler for the given type.
        // 인자1 : type - (string | symbol) Type of event to listen for, or '*' for all events
        // 인자2 : handler - Function Function to call in response to given event
        this.emitter.on('message', this.receiveHandler);
    },
    data(){
        return {
            textMessage:'',
        }
    },
    methods: {
        receiveHandler(msg){
            this.textMessage = msg;
        }   
    },
}
</script>