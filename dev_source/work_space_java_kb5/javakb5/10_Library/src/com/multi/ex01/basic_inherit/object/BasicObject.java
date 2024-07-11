package com.multi.ex01.basic_inherit.object;

public class BasicObject/* extends Object*/ {

    public static void main(String[] args) {
        // Object는 Java에서 사용하는 모든 객체의 부모 객체로 상속문을 쓰지 않아도 자동으로 상속된다.
        // Object는 Type으로 활용하면 모든 객체를 담을수 있는 Type이 되지만, 자식의 메소드를 사용할수 없다.
        //  -> 원래 생선된 자식 객체로 type casting 하면 된다.
        Object object1 = new Object();
        Object object2 = new String("test");
        Object object3 = "test";

        Member m1 = new Member("test1", "홍길동", 21); // 1==3 데이터는 같음
        Member m2 = new Member("test2", "홍길동", 21); // 1,3번하고 다른 데이터
        Member m3 = new Member("test1", "홍길동", 21);

        // toString() : 일반적인 객체의 정보를 출력하는 메소드, 해당 메소드 없이 객체의 이름만으로도 자동 호출!
        // Object.toString() : java.lang.Object@1209079  // class정보@hash코드=식별자
        //                     com.multi.ex01.object.Member@1df28bb
        //                     com.multi.ex01.object.Member@171769e
        System.out.println(object1);
        System.out.println(object2.toString());
        System.out.println(object3.toString());
        System.out.println(m1);
        System.out.println(m2.toString());
        System.out.println(m3.toString());
        // 만일 객체어서 toString을 오버라이딩을 하지 않은 경우 Object toString을 호출한다.
        System.out.println("------------------------------------------------------");
        
        // hashCode : 객체의 고유 식별 번호(ID)로 활용되는 정보
        System.out.println(object1.hashCode()); // 18911353
        System.out.println(object2.hashCode()); // 3556498 -> 문자열 test의 hash코드
        System.out.println(object3.hashCode()); // 3556498 -> 문자열 test의 hash코드

        // Member hashCode 오버라이드 전 -> 틀린 결과!
        System.out.println(m1.hashCode()); // 31402171
        System.out.println(m2.hashCode()); // 24213150
        System.out.println(m3.hashCode()); // 22214370
        // -> m1과 m3의 hashcode가 달라서 틀린것!

        // Member hashCode 오버라이드 후 -> 올바른 결과
        System.out.println(m1.hashCode()); // 256178341
        System.out.println(m2.hashCode()); // 256179302
        System.out.println(m3.hashCode()); // 256178341
        // 정석 : hashCode, equals는 가능하면 객체에서 생성해서 활용하는 것이 좋다.
        //   -> 특히 map을 사용할때는 반드시 객체에 hashCode를 오버라이드 해야한다!

        // identityHashCode : 메모리 주소로 참고하여 hashcode를 생성함
        System.out.println("identityHashCode");
        System.out.println(System.identityHashCode(m1));
        System.out.println(System.identityHashCode(m2));
        System.out.println(System.identityHashCode(m3));

        // equals : 객체의 고유 값을 비교하여 객체가 같은지 확인해주는 메소드
        // -> 실제 Class를 설계할때 오버라이드가 필요
        // 객체간 비교하는 방법
        // -> 예전에는 사람 손으로 일일히 비교해야했다.
//	 	boolean isEquals = m1.getName().equals(m2.getName()) && m1.getAge() == m2.getAge();
        System.out.println("객체 비교");
        System.out.println(m1 == m3); // false, 주소상으로는 객체가 같지 않다!!
        System.out.println(m1.equals(m3)); // true, 재정의된 equals 실제 값을 비교한다.

        // clone : 객체를 복사하는 메소드, 오버라이드 필요!!
        // -> 만드는 방법 많이 귀찮다.
//        Member m4 = m1; //soft copy!!
        // 아래 hard copy하는 방법도 매우 유용한 방법으로 의외로 많이 활용!!
        Member m4 = new Member(m1.getId(), m1.getName(), m1.getAge());
        System.out.println(m4);

        // clone으로 hard copy하는 방법
        Member m5 = m1.clone();
        System.out.println("클론된 객체 비교");
        System.out.println(m1 == m4); // false
        System.out.println(m1 == m5); // false
        System.out.println(m1.equals(m4)); // true
        System.out.println(m1.equals(m5)); // true

    }
}
