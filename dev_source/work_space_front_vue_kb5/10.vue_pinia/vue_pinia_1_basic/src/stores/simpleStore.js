import {defineStore} from 'pinia';
import {ref, computed} from 'vue';

// 스토어 정의 구간
// 이름 규칙 use~~ : 생성자 느낌
export const useSimpleStore = defineStore ('test', ()=>{
    // store에서 사용할 변수 선언부
    const count = ref(0);
    const name = ref('홍길동');
    const list = ref([
        { name: '박길동', age: 41, address: '서울시 강남구 역삼동' },
        { name: '최길동', age: 21, address: '서울시 강남구 삼성동' },
        { name: '임길동', age: 43, address: '서울시 강남구 도곡동' },
    ]);

    // 외부에서 조작 가능한 setter/getter 함수 설계
    const increment = ()=>{
        count.value++;
    };
    const addList = (member)=>{
        list.value.push(member);
    };
    const reset = ()=>{
        count.value=0;
        name.value='홍길동';
        list.value=[];
    };

    // computed
    const doubleCount = computed(()=>count.value*2);

    // 외부에서 사용할 모든 변수를 리턴으로 설계 = 클로저 함수
    return {count, name, list, increment, addList, reset, doubleCount};

});


