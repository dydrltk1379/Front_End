
import { createRouter, createWebHistory } from 'vue-router'
import Page0 from '@/pages/Page0.vue'
import Page1 from '@/pages/Page1.vue'
// import Page2 from '@/pages/Page2.vue'
// import Page3 from '@/pages/Page3.vue'
// import Page4 from '@/pages/Page4.vue'
// import Page5 from '@/pages/Page5.vue'
// import Page6 from '@/pages/Page6.vue'
// import Page7 from '@/pages/Page7.vue'
// import Page8 from '@/pages/Page8.vue'

const router = createRouter({
    history: createWebHistory(),
    routes : [
        { path: '/', name: "Page0", component: Page0 },
        { path: '/Page1', name: "Page1", component: Page1 },
        // { path: '/Page2', name: "Page2", component: Page2 },
        // { path: '/Page3', name: "Page3", component: Page3 },
        // { path: '/Page4', name: "Page4", component: Page4 },
        // { path: '/Page5', name: "Page5", component: Page5 },
        // { path: '/Page6', name: "Page6", component: Page6 },
        // { path: '/Page7', name: "Page7", component: Page7 },
        // { path: '/Page8', name: "Page8", component: Page8 },
    ]
})

export default router;