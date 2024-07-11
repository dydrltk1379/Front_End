package quiz.q4;

import java.util.ArrayList;

public class Man {
    public static void main(String[] args) {
        ArrayList list = new ArrayList(); // ArrayList 선언, 제네릭 타입을 지정하지 않음 (Raw type)
        list.add("자바"); // 문자열 "자바"를 리스트에 추가 (자동형변환)

        list.add(new 사람()); // 사람 객체를 리스트에 추가 (자동형변환)
        list.add(new ArrayList()); // 새로운 ArrayList 객체를 리스트에 추가 (자동형변환)

        String s = (String)list.get(0); // 강제형변환 (downcasting), Object 타입을 String 타입으로 변환

        list.add(100); // 정수 100을 리스트에 추가 (박싱, autoboxing) - int 값이 Integer 객체로 변환되어 추가됨

        int i = (Integer)list.get(3); // 강제형변환 (downcasting) 및 언박싱 (unboxing), Object 타입을 Integer 타입으로 변환하고, 다시 int 타입으로 변환
    }
}