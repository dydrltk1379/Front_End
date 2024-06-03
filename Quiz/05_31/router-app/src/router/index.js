
// ★ URL을 활용하기 위한 기초 지식 정리
// 
// 1. URL(Uniform Resource Locator)이란?
// - URL은 인터넷에서 웹 페이지, 이미지, 비디오 등 리소스의 위치를 가리키는 문자열
// - http://www.google.com < 네이버 메인이 있는 url
// - https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png // google 

// 2. Query string (https://en.wikipedia.org/wiki/Query_string)
// - URL 일부로 서버에게 요청(request)시 필요한 정보를 URL과 같이 전달하는 메커니즘
// - https://example.com/over/there?name=ferret
// - https://example.com/path/to/page?name=ferret&color=purple

// 3. REST (https://restfulapi.net/http-methods/ https://meetup.nhncloud.com/posts/92)
// - Rest API란? 
// - HTTP 프로토콜 기반으로 자원을 관리할수 있도록 고안된 아키텍처 스타일
// - 자원을 관리하기 위한 주요 HTTP Method는 CRUD(POST, GET, PUT, DELETE 등)이 있다.
// url 예시
// HTTP GET http://www.appdomain.com/users
// HTTP GET http://www.appdomain.com/users?size=20&page=5
// HTTP GET http://www.appdomain.com/users/123
// HTTP GET http://www.appdomain.com/users/123/address

// https://router.vuejs.org/ -->
// https://router.vuejs.org/guide/essentials/route-matching-syntax.html
// https://router.vuejs.org/guide/essentials/dynamic-matching.html


import {createRouter, createWebHistory} from 'vue-router'
import Home from '@/pages/Home.vue'
import Param from '@/pages/Param.vue'
import About from '@/pages/About.vue'
import Members from '@/pages/Members.vue'
import MemberInfo from '@/pages/MemberInfo.vue'
import Videos from '@/pages/Videos.vue'
import VideoPlayer from '@/pages/VideoPlayer.vue'
import NotFound from '@/pages/NotFound.vue'

const router = createRouter({
    history:createWebHistory(),
    routes : [
        // 이름이 없는 path 라우팅 -> path로만 호출가능
        // {path : '/', componen:Home},
        // 네임드 라우팅 -> path + name으로 라우팅 가능!
        {path : '/',  name: "home", component:Home},
        {path : '/param',  name: "param", component:Param, props:true},
        {path : '/about',  component:About,},
        {path : '/members',  component:Members,},
        // /members/:id -> /members + {path}를 통해 새로운 페이지 로드
        // {path : '/members/:id',  component:MemberInfo,},
        {path : '/members/:id(\\d+)',  component:MemberInfo,},
        { path: '/videos', component: Videos,
            children : [
                { path:":id", component: VideoPlayer }
            ]
        },
        { path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound },
    ],
});

// router.addRoute([]);

export default router;