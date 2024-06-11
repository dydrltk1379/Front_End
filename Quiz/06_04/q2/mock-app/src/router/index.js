import { createRouter, createWebHistory } from 'vue-router'
import AxiosBox from '@/pages/AxiosBox.vue'
import AsyncBox from '@/pages/AsyncBox.vue'
import PostBox from '@/pages/PostBox.vue'

const router = createRouter({
    history: createWebHistory(),
    routes : [
        { path: '/1', name: "AxiosBox", component: AxiosBox },
        { path: '/2', name: "AsyncBox", component: AsyncBox },
        { path: '/3', name: "PostBox", component: PostBox },
    ]
})

export default router;