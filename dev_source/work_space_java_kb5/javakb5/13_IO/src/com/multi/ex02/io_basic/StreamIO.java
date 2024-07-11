package com.multi.ex02.io_basic;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

public class StreamIO {
    // - IO 끝판왕
    // Stream이란? - (한방향 빨대다!)
    // - Binary(이진) 데이터를 다루는 Stream = 1byte씩 처리 가능
    // - 활용 : 이미지나 동영상 파일, 네트워크, 프로그램간 데이터 전송 때

    // IO 객체 사용시의 코딩 테크닉 - 고전 ver.
    // 1. 가장 윗단에 IO객체를 선언하고, null로 초기화한다. 이름은 앞글자를 줄여서 선언한다.
    // 2. try-catch문을 열고, e.printStackTrace 선언 및 finally 문 선언
    // 3. IO 객체를 오픈한다. -> try안에서
    // 4. 필요한 IO을 수행한다. 보통 while문으로 수행
    // 5. finally에 사용한 IO객체'들'을 정리한다.
    // -> ※ try-with-resources문 활용 권장 ★★★★★
    public static void main(String[] args) {
        // 고전, 빨간줄 ctrl alt o
        InputStream is = null;
        OutputStream os = null;

        try {
            // 오픈부
//            is = new InputStream(); // InputStream sbstract class라 생성 불가
            is = System.in; // open 코드를 대체하는 코드, 콘솔 입력
            os = System.out; // 콘솔 출력 byte stream

            // 동작부
            System.out.println("숫자를 입력하세요.");
            int read = is.read();
            os.write(read);
            // write를 강제로 하는 방법
            // 1. flush : write 도중에 데이터를 강제로 밀어내는 방법, 명시적 활용 필요
            // 2. clost : 자원을 정리하면서 flush와 동일하게 강제로 데이터를 밀너 내는 기능
            // os.flush;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            // close 구현부 - 리소스 정리하기 위해서 개별로 닫음
            if(is != null){
                try {
                    is.close();
                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    e.printStackTrace();
                }
            }
            if(os != null){
                try {
                    os.close();
                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    e.printStackTrace();
                }
            }
        }
    }
}
