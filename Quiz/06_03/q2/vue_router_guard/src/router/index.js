
// lazy-loading(지연 로딩? 게으른, 늦은 로딩...) 처리 
// - 패키지가 커지는 경우 현재 모든 js코드를 로드하는 경우 시간 지연이 발생
// - 이때 필요한 페이지만 로드하고, 필요하지 않은 페이지는 나중에 로딩하는 기능을 지원
// - 해당 기능은 lazy-loading이라 하며, 해당 기능을 통해 지연 로딩 처리가 가능
// - webpackChunkName으로 그룹핑 가능, 연관성이 높은 페이지 그룹을 미리 로드 가능 
// https://v3.router.vuejs.org/kr/guide/advanced/lazy-loading.html

import {createRouter, createWebHistory, isNavigationFailure} from 'vue-router'
const Home = () => import(/* webpackChunkName: "home" */ '@/pages/Home.vue');
const About = () => import(/* webpackChunkName: "home" */ '@/pages/About.vue');
const Param = () => import(/* webpackChunkName: "home" */ '@/pages/Param.vue');
const Members = () => import(/* webpackChunkName: "members" */'@/pages/Members.vue');
const MemberInfo = () => import(/* webpackChunkName: "members" */'@/pages/MemberInfo.vue');
const Videos = () => import(/* webpackChunkName: "videos" */'@/pages/Videos.vue');
const VideoPlayer = () => import(/* webpackChunkName: "videos" */'@/pages/VideoPlayer.vue');
const NotFound = () => import(/* webpackChunkName: "home" */ '@/pages/NotFound.vue');


// 네비게이션 컴포넌트 가드로 - beforeEnter를 활용하기 위한 메소드
// 강사 사견 : 파라미터 검사는 해당 페이지(컴포넌트)에서 구현하는 것이 코드 관리에 용이하다 생각 
const membersIdGuard =(to, from)=>{
    // members/:id 경로는 반드시 이전 경로가 members이거나 members:id만 허용
    // if (from.name !== "members" && from.name !== "members/id") {
    //     return false;
    // }
}

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
        {path: '/members/:id', name:'members/id',  component:MemberInfo,
            // routes 셋팅중 컴포넌트 개별 가드를 셋팅할수 있다!
            beforeRouteEnter : membersIdGuard,
        },
        { path: '/videos', component: Videos, 
            children : [
            { path:":id", component: VideoPlayer }]
        },
        { path: '/:pathMatch(.*)*', name: 'NotFound', component: NotFound },
    ],
});

// navigation-guards(네이게이션 가드)
// 1. 전역 가드
// - beforeEach : 라우팅 이전에 전역으로 호출 되는 Hook 
// - beforeResolve : beforeEach와 유사, 비동기 컴포넌트가 모두 끝난 이후에 호출
// - afterEach : 라우팅이 끝난 다음에 호출되는 hook, 주로 애널리틱스 처리

// 2. 컴포넌트 내부 가드 (컴포넌트 개별)
// - beforeRouteEnter : 컴포넌트가 렌더링이 이전에 호출 
// - beforeRouteUpdate : url이 변경될때 호출, `/users/1`과 `/users/2`와 같은 path, 파라미터 변경을 탐지
// - beforeRouteLeave : 렌더링 이후 라우트에서 떠날때 호출
//
// 참고 : https://router.vuejs.kr/guide/advanced/navigation-guards

// beforeEach
// - 라우팅 이전에 글로벌로 호출되는 hook
// - 라우팅이 되기 이전에 페이지 권한에 따른 필터링이나 공통 작업을 이곳에 처리가능
// - ※ 개발 초반부터 해당 코드가 있으면 개발하기 매우 불편하다!!! -> 후반에 셋팅!!!
// to: 라우트: 대상 Route 객체로 이동합니다. ex) to.path, to.query, to.params ..
// from: 라우트: 현재 라우트로 오기전 라우트 
// next : vue 4.0이후에는 사용하지 않음. 다음 라우팅으로 넘기는 메소드였음.
router.beforeEach((to, from)=>{
    if(to.path == '/param'){
        return; // 아무처리 하지 않고 다음 루우터로 이동, pass!
    }
    else if(to.path == '/home'){
        return '/'; // '/' 경로로 리다이렉트하는 방법!
    } 
    else if(to.query && Object.keys(to.query).length > 0){ // 쿼리가 있을경우
        return{path:to.path, query:{}, prams:to.params}; // query를 제거하고 다시 라우팅!
    }
    // return false; // 라우팅이 되지 않는 코드! -> 에러처리가 되지 않음으로 없어야한다!
});

// afterEach
// - 라우팅 이후에 호출되는 메소드
// to: 라우트: 대상 Route 객체 로 이동합니다. ex) to.path, to.query, to.params ..
// from: 라우트: 현재 라우트로 오기전 라우트 
// failure : 라우팅이 중단되었을때의 발생하는 객체
router.afterEach((to, from, failure)=> {
    if (isNavigationFailure(failure)) {
        console.log("@@ 내비게이션 중단 : ", failure)
        return { name:"home" };
    }
})

export default router;