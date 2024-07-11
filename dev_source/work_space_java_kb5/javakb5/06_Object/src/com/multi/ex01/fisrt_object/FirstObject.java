package com.multi.ex01.fisrt_object;

import java.util.Date;

public class FirstObject {

    public static void main(String[] args) {
//      type   변수명  초기화문
        int    value  = 10;
        Member member = new Member(); // 객체를 생성하는 키워드 = new, heap으로 할당한다.
        member.name = "홍길동";
        member.age = 20;
        member.phoneNumber = "010-1234-5678";
        member.address = "서울시 강남구 역삼동";

        member.printInfo();

        고양이 나비 = new 고양이();
        나비.이름 = "나비";
        나비.나이 = 4;
        나비.종 = "페르시안";
        나비.울음소리 = "미야옹";
        나비.집사이름 = "홍길동";

        System.out.println("우리집 고양이 정보 출력");
        System.out.println("고양이 이름 : " + 나비.이름);
        System.out.println("고양이 나이 : " + 나비.나이);
        System.out.println("고양이 품종 : " + 나비.종);
        System.out.println("고양이 울음소리 : " + 나비.울음소리);
        System.out.println("고양이 집사이름 : " + 나비.집사이름);
    }
}

// public class : .java파일과 이름이 일치하는 class이고, 파일당 하나만 존재 가능함!
// default class : public class가 아닌 일반 class를 의미하고, 외부에서 접근이 불가!
// -> 가능하면 public 클래스와 .java파일을 1:1로 만든다.

// 회원정보를 관리하는 Class
class Member{
    // 멤버 변수
    String name;
    int age;
    String phoneNumber;
    String address;

    // 멤버 메소드
    void printInfo(){
        System.out.println("name : " + name + " age : " + age + " phone number : " + phoneNumber + " address : " + address);
    }
}

class 회원{
    String 이름;
    int 나이;
    String 전화번호;
    String 주소;
}

class 고양이{
    String 이름; // 야옹이, 나비, 도라에몽...
    int 나이; // 5,6,7 ..
    String 종; // 페르시안, 샴, 러시안블루...
    String 울음소리; // 냐옹, 냐냐옹, 미야옹 ...
    String 집사이름; // 홍길동 ...
    boolean 예방접종여부; // true, false
}

class 강아지{
    String 이름; // 야옹이, 나비, 도라에몽...
    int 나이; // 5,6,7 ..
    String 종; // 페르시안, 샴, 러시안블루...
    boolean 예방접종여부; // true, false
    Date 최근산책시간; // 시간정보
}
