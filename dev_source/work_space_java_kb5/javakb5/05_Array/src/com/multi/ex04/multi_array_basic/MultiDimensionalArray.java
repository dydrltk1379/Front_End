package com.multi.ex04.multi_array_basic;

import java.util.Arrays;

// 다차원배열
public class MultiDimensionalArray {
	public static void main(String[] args) {
		// 다차원 배열 반복시 index 키워드는 i,j,k이나 행렬이면 m,n을 활용

		// 1. 가장 기본적인 2차원 배열 활용법
		int[][] array1 = new int[10][10]; // 10 * 10 = 100칸의 int 공간을 생성
		
		for(int  i = 0; i < array1.length; i++) {
			for(int j = 0; j < array1[i].length; j++) {
				array1[i][j] = i * 10 + j; // 0 ~ 99까지 초기화
				System.out.print(array1[i][j] +" "); // 행렬 ij 출력!
			}
			System.out.println();
		}
		System.out.println("-----------------------------------------");
		
		for(int i = 0; i < array1.length; i++) {
			for(int j = 0; j < array1[i].length; j++) {
				System.out.print(array1[j][i] + " "); // 행렬 ji 출력!
			}
			System.out.println();
		}
		System.out.println("-----------------------------------------");
		
		
		// 2. 2차원 가변형 배열 활용법
		int[][] array2 = new int[10][]; // 2차원 배열의 크기가 정해지지 않은 경우
		System.out.println(Arrays.toString(array2));
		
		for(int i = 0; i < array2.length; i++) {
			array2[i] = new int[i + 1];
			for(int j = 0; j < array2[i].length; j++) {
				array2[i][j] = i * 10 + j;
				System.out.print(array1[i][j] +" "); // 행렬 ij 출력!
			}
			System.out.println();
		}
		System.out.println("-----------------------------------------");
		
		// 3. 2차원 배열 초기화 + 생성
		int[][] array3 = {{1,2,3,4},
						  {2,3}, 
						  {4,3,2,1},}; // 가변 선언이 가능하다!
		int[][] array4 = new int[][] {{1,2,3,4},
									 {2,3}, 
									 {4,3,2,1},}; 
		int[][] array5 = new int[][] { new int[]{ 1, 2, 3, 4 }, 
									   new int[]{ 2, 3 }, 
									   new int[]{ 4, 3, 2, 1 }, };
        for(int i = 0; i < array3.length; i++) {
        	for(int j = 0; j < array3[i].length; j++) {
        		System.out.print(array3[i][j] +" "); // 행렬 ij 출력!
        	}
        	System.out.println();
        }
	}
}


























