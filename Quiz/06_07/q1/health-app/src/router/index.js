
import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/pages/Home.vue';
import MemberInfo from '@/pages/MemberInfo.vue';
import PTMemberInfo from '@/pages/PTMemberInfo.vue';


const router = createRouter({
    history: createWebHistory(),
    routes : [
        { path: '/', name: "Home", component: Home },
        { path: '/memberinfo', name: "MemberInfo", component: MemberInfo },
        { path: '/ptmemberinfo', name: "PTMemberInfo", component: PTMemberInfo },
    ]
})

export default router;