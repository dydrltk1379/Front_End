package com.multi.ex01.exception;

import java.io.IOException;

public class Trycatch2 {

    public static void main(String[] args) {
        // try-catch문 복합형
        try {
            System.out.println("에러가 발생할수 있는 구간! 시작");
            if(true){
//                throw new IOException(); // IO 에러를 발생!
                throw new Exception(); // 그냥 에러를 발생하는 코드!
            }
            System.out.println("에러가 발생할수 있는 구간! 끝");
        } catch (IOException e) { // 가까운 곳부터 좁은 범위 에러를 처리할수 있다.
            // catch문으로 받은 예외는 다음 catch문으로 전파되지 않는다!!
            System.out.println("IOException 처리 완료");
            // -> sout문은 Spring으로 올라가면 log로 처리하는 구간!
        } catch (Exception e) { // 넓은 범위 에러를 묶어 Exception으로 처리할수 있다.
            System.out.println("Exception 처리 완료!");
            return; // try-catch문 이후에 문장을 실행시키지 않을때는 return으로 처리
        } finally {
            // try-catch문 이후에 반드시 동작해야하는 코드가 있는 경우 작성하는 곳
            // 예시 : 주로 자원을 닫는 용도로 할용
            System.out.println("finally 구간 출력!!");
            System.out.println("이곳은 예외가 발생하든 안하든 둘다 동작하는 구간!");
        }
        System.out.println("main문 끝!!");
    }
}