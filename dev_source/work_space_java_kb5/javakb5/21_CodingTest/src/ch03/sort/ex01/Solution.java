// 정렬 > k번째수
// https://school.programmers.co.kr/learn/courses/30/lessons/42748
package ch03.sort.ex01;

//  array	                commands	                        return
//  [1, 5, 2, 6, 3, 7, 4]	[[2, 5, 3], [4, 4, 1], [1, 7, 3]]	[5, 6, 3]
//  TC1
//  #1 : [2, 5, 3], [1, 5, 2, 6, 3, 7, 4], 자르기
//  #2 : [5, 2, 6, 3] 정렬
//  #3 : [2, 3, 5, 6] k=5

import java.util.Arrays;

public class Solution {
    public int[] solution(int[] array, int[][] commands) {
        int[] answer = new int[commands.length];
        for(int i = 0; i < commands.length; i++){
            int[] newArray = Arrays.copyOfRange(array, commands[i][0] -1, commands[i][1]);
//            System.out.println(Arrays.toString(newArray));
            Arrays.sort(newArray);
//            System.out.println(Arrays.toString(newArray));
//            System.out.println("k : " + newArray[commands[i][2] - 1]);
            answer[i] = newArray[commands[i][2] - 1];
        }
        return answer;
    }

    public static void main(String[] args) {
        int[] array =  {1, 5, 2, 6, 3, 7, 4};
        int[][] commands = {{2, 5, 3}, {4, 4, 1}, {1, 7, 3}};
        int[] result = new Solution().solution(array, commands);
        System.out.println(Arrays.toString(result));
    }
}