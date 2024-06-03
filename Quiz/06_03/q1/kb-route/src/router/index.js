import {createRouter, createWebHistory} from 'vue-router'
import BikeBox from '@/pages/BikeBox.vue'
import BusBox from '@/pages/BusBox.vue'
import WalkBox from '@/pages/WalkBox.vue'
import Title from '@/pages/Title.vue'

const router = createRouter({
    history:createWebHistory(),
    routes : [
        {path : '/BikeBox', name: 'BikeBox', component:BikeBox},
        {path : '/BusBox', name: 'BusBox', component:BusBox},
        {path : '/WalkBox', name: 'WalkBox', component:WalkBox},
        {path : '/Title', name: 'Title', component:Title},
    ]
});

export default router;