
import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/pages/Home.vue'
import Input from '@/pages/Input.vue'
import Input2 from '@/pages/Input2.vue'
import List from '@/pages/List.vue'
import Update from '@/pages/Update.vue'

const router = createRouter({
    history: createWebHistory(),
    routes : [
        { path: '/', name: "Home", component: Home },
        { path: '/list', name: "List", component: List },
        { path: '/input', name: "Input", component: Input },
        { path: '/input2', name: "Input2", component: Input2 },
        { path: '/update', name: "Update", component: Update },
    ]
})

export default router;