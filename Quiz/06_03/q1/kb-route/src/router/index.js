import {createRouter, createWebHistory} from 'vue-router';
import Home from '../pages/Home.vue';
import BikeBox from '../pages/BikeBox.vue';
import BusBox from '../pages/BusBox.vue';
import WalkBox from '../pages/WalkBox.vue';

const router = createRouter({
    history:createWebHistory(),
    routes : [
        {path: "/", name: "home", component:Home},
        {path: "/BikeBox", name: "BikeBox", component:BikeBox},
        {path: "/BusBox", name: "BusBox", component:BusBox},
        {path: "/WalkBox", name: "WalkBox", component:WalkBox}
    ]
});

export default router;