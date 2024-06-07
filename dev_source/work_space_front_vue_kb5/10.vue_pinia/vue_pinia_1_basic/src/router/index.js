
import { createRouter, createWebHistory } from 'vue-router'
import App0 from '@/pages/App0.vue';
import App1 from '@/pages/App1.vue'
import App2 from '@/pages/App2.vue'
import App3 from '@/pages/App3.vue';
import Home from '@/pages/Home.vue';

const router = createRouter({
    history: createWebHistory(),
    routes : [
        { path: '/', name: "Home", component: Home },
        { path: '/app0', name: "App0", component: App0 },
        { path: '/app1', name: "App1", component: App1 },
        { path: '/app2', name: "App2", component: App2 },
        { path: '/app3', name: "App3", component: App3 },
    ]
})

export default router;