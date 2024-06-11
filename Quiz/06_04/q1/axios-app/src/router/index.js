import { createRouter, createWebHistory } from 'vue-router'
import AxiosBox from '@/pages/AxiosBox.vue'
import AsyncBox from '@/pages/AsyncBox.vue'
import PostBox from '@/pages/PostBox.vue'

const router = createRouter({
    history : createWebHistory(),
    routes : [
        {path : '/', name : "AxiosBox", component : AxiosBox },
        {path : '/AsyncBox', name : "AsyncBox", component : AsyncBox },
        {path : '/PostBox', name : "PostBox", component : PostBox },
    ]
})

export default router;