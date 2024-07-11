// 스택/큐 > 같은 숫자는 싫어
// https://school.programmers.co.kr/learn/courses/30/lessons/12906
package ch02.stack_queue.ex01;

//  arr	                answer
//  [1,1,3,3,0,1,1]	    [1,3,0,1]
//  [4,4,4,3,3]	        [4,3]

// 풀이 시뮬레이션
// 로직 : read와 prev를 비교, 만일 다르면? answer에 추가하는 전략
// #0 [1,1,3,3,0,1,1] index = 0, read=0, prev=-1 answer=[] 
// #1 [1,1,3,3,0,1,1] index = 0, read=1, prev=1 answer=[1]
// #2 [1,1,3,3,0,1,1] index = 1, read=1, prev=1 answer=[1]
// #3 [1,1,3,3,0,1,1] index = 2, read=3, prev=1 answer=[1,3]
// #4 [1,1,3,3,0,1,1] index = 3, read=3, prev=3 answer=[1,3]
// #6 [1,1,3,3,0,1,1] index = 4, read=0, prev=3 answer=[1,3,0]
// #7 [1,1,3,3,0,1,1] index = 5, read=1, prev=0 answer=[1,3,0,1]
// #8 [1,1,3,3,0,1,1] index = 6, read=1, prev=1 answer=[1,3,0,1]

import java.util.*;

public class Solution {
    // 스택 없이 배열로만 풀이한 케이스
    public int[] solution2(int []arr) {
        int[] answer = new int[arr.length];
        int prev = -1; // 이전 값을 기억하는 변수, 초기값은 인자로 올수 없는 음수로 초기화
        int count = 0; // answer의 크기를 결정하는 변수

        for(int i = 0; i < arr.length; i++){
            if(arr[i] != prev){
                answer[count++] = arr[i]; // 답 추가
                prev = arr[i]; // 이전 값 업데이트
            }else{
                continue;
            }
        }
        return Arrays.copyOf(answer, count);
    }

    // Stack으로 풀이
    // Stack 풀이 (문제 의도대로 풀어보기)
    // Stack [1, 1, 3, 3, 0, 1, 1, -1]  prev = -1
    // Stack [1, 3, 3, 0, 1, 1, -1, 1]  prev = -1, pop = 1, 비교해서 다르면 뒤로 추가!
    // Stack [3, 3, 0, 1, 1, -1, 1]  prev = 1, pop = 1, 같은 경우임으로 버린다.
    // Stack [3, 0, 1, 1, -1, 1, 3]  prev = 1, pop = 3, 다른경우임으로 뒤로 추가
    // Stack [0, 1, 1, -1, 1, 3]  prev = 3, pop = 3, 같은 경우임으로 버린다.
    // Stack [1, 1, -1, 1, 3, 0]  prev = 3, pop = 0, 다른 경우로 추가
    // Stack [1, -1, 1, 3, 0, 1]  prev = 0, pop = 1, 다른 경우로 추가
    // Stack [-1, 1, 3, 0, 1]  prev = 1, pop = 1, 같음으로 버린다.
    // Stack [1, 3, 0, 1]  -1을 만나면 끝!
    public int[] solution(int []arr) {
    	Deque<Integer> deque = new LinkedList<>(); // LinkedList는 탐색은 O(n), 쓰기 삭제 O(1)
//        Deque<Integer> deque = new ArrayDeque<>(); // // ArrayDeque로 구성된 큐, 탐색 O(1), 쓰기 삭제, O(n)

        for(int i = 0; i < arr.length; i++){
            deque.add(arr[i]);
        }
        System.out.println(deque);
        deque.add(-1); // 종료점
        while(true){
//        for(int i = 0; i < 10; i++){ // 끝점을 모를때 반복문으로 제어한다.
            //    		System.out.println("deque(전) : " + deque);
            int first = deque.pop(); // pop : 앞에 값을 가져오는 함수, get + delete!
            if(first == -1) {
                break;
            }
            int second = deque.getFirst(); // getFirst : 앞에 값이 무엇이지를 가져오는 메소드, delete 되지 않음!
//    		System.out.println("first : " + first);
//    		System.out.println("second : " + second);

            if(first != second) {
                deque.add(first);
            }

//    		System.out.println("deque(후) : " + deque);
//    		if(count == 10) { // 임시 break점
//    			break;
//    		}
        }

        int count = 0;
        int[] answer = new int[deque.size()];
        while(!deque.isEmpty()) {
            answer[count++] = deque.pop();
        }

        return answer;
    }

    public static void main(String[] args) {
        int[] arr = {1,1,3,3,0,1,1};
        int[] result = new Solution().solution(arr);
        System.out.println(Arrays.toString(result));
    }
}