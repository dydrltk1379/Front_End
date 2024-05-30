import { createApp } from 'vue'
import App from './App.vue'
import mitt from 'mitt';

import './assets/main.css'

const emitter =  mitt();
emitter.on('*', (type, e) => console.log(`## 이벤트 로그 : ${type} -> `, e) )

const app = createApp(App)
app.config.globalProperties.emitter = emitter;
app.mount("#app");