package ch00.basic;

// 해당 문제에서 테스트
// https://school.programmers.co.kr/learn/courses/30/lessons/1845

import java.util.*;

public class Solution {
    public int solution(int[] nums) {
        // 1. try-catch문 + printStackTrace() 활용해서 에러 출력하기
        //   -> 해당 문장만 외우면 일단 웬만한 에러는 원인 파악 제대로 된다.
        // ctrl + alt + t
        try {
//            int value = 10/0;

            // 2. 리턴 type을 모를때 간단히 에러로 체크하기
//            String value = list.iterator(); // 일단 String으로 넣고 에러체크하면 간단!
//            Iterator<String> value = list.iterator();

            // 3. 리플렉션 활용 해서 메소드 출력하기 = class
            // Class로 가져오기
            Class c = Class.forName("java.lang.String");
            System.out.println(Arrays.toString(c.getMethods()).replace(",",",\n"));

            // .class로 가져오기
            LinkedList<String> list = new LinkedList<>();
            System.out.println(LinkedList.class.getMethods());
            System.out.println(Arrays.toString(LinkedList.class.getMethods()).replace(",",",\n"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        int result = new Solution().solution(new int[]{1,2,3,4,5});
        System.out.println(result);
    }
}