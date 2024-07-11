package com.multi.ex05.enum_exam;

import java.util.*;

public class _Run {
    public static void main(String[] args) {
        // 선언하는 방법
        // public static final EnumBasic VALUE1 = new EnumBasic(1,"문자열 상수값)";
        EnumBasic enumValue = EnumBasic.VALUE2;
        // EnumBasic enumValue = EnumBasic.valueOf("VALUE2"); // key, value

        // 출력 방법
        System.out.println(enumValue); // toString, EnumBasic{intValue=2, stringValue='문자열 상수값2'}
        System.out.println(enumValue.name()); // 상수 이름, VALUE2
        System.out.println(enumValue.ordinal()); // 상수의 선언 순서, 1
        System.out.println(enumValue.getStringValue()); // getter, 문자열 상수값2
        System.out.println(enumValue.getIntValue()); // getter, 2
        System.out.println("-------------------------------------");

        // 순회 방법, 주의점(values()) : 배열을 생성하여 호출함으로 성능저하가 발생할 수 있다.
        // -> 성능 개선을 위해 map을 활용하는 것을 권장
        for(EnumBasic e : EnumBasic.values()){ // 이건 쓰지 마라
            System.out.println(e.name());
//            VALUE1
//            VALUE2
//            VALUE3
        }
        System.out.println("-------------------------------------");

        // 비교하는 방법
        EnumBasic enumValue1 = EnumBasic.VALUE1;
        EnumBasic enumValue2 = EnumBasic.VALUE2;

        // == 로도 비교 가능
        System.out.println(enumValue1 == EnumBasic.VALUE1); // true
        System.out.println(enumValue1 == enumValue2); // false

        // compareTo로 비교하는 방법 -> 정렬할 때 활용
        System.out.println(enumValue1.compareTo(EnumBasic.VALUE1)); // 0
        System.out.println(enumValue1.compareTo(enumValue2)); // -1
        System.out.println("-------------------------------------");

        // Week
        System.out.println(Arrays.toString(Week1.values()));
        // [MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY]
        System.out.println(Arrays.toString(Week2.values()));
        // [MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY]
        System.out.println(Arrays.toString(Week3.values()));
        // [Week3{day='월', order=1}, Week3{day='화', order=2}, Week3{day='수', order=3}, Week3{day='목', order=4}, Week3{day='금', order=5}, Week3{day='토', order=6}, Week3{day='일', order=7}]
        System.out.println("-------------------------------------");

        // 컬렉션의 Type으로도 활용 가능
        List<Week3> list = new ArrayList<>();
        list.add(Week3.TUESDAY);
        list.add(Week3.MONDAY);
        list.add(Week3.THURSDAY);
        list.add(Week3.SUNDAY);
        System.out.println(list);
        // [Week3{day='화', order=2}, Week3{day='월', order=1}, Week3{day='목', order=4}, Week3{day='일', order=7}]

        // 자연 order로 정렬하기 (선언한 순서)
        list.sort(Comparator.naturalOrder());
//        Collections.sort(list);
        System.out.println(list);
        // [Week3{day='월', order=1}, Week3{day='화', order=2}, Week3{day='목', order=4}, Week3{day='일', order=7}]

        // 사용자 order로 정렬하기
        list.sort((o1, o2) -> o1.getOrder() - o2.getOrder());
        System.out.println(list);
        // [Week3{day='월', order=1}, Week3{day='화', order=2}, Week3{day='목', order=4}, Week3{day='일', order=7}]
        System.out.println("-------------------------------------");



    }
}
