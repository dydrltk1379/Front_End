package com.multi.ex04.stream;

import javax.swing.text.html.Option;
import java.util.*;
import java.util.function.BinaryOperator;
import java.util.stream.IntStream;

public class StreamBasic02 {
    // Collection에서 Stream 활용 예제
    // stream : 하나의 쓰레드 처리로 서버 프로그래밍에서는 일반적으로 stream을 활용 권장
    //          -> 이유 : 이미 Server가 Thread 처리가 기본적이라 의미가 없다.
    // parallelStream : 병렬처리 알고리즘, Thread 환경이 아니고 고속처리가 필요할때
    public static void main(String[] args) {
        // List 선언부
        // List - stream : 이 방법을 추천
        List<Integer> list = new ArrayList<>(List.of(2, 1, 4, 5, 9, 6, 8, 3, 7, 10));
        List<String> strList1 = new ArrayList<>(List.of("CCC","BBB","AAA","DDD","ABC"));

        // 중복 된 값이 포함된 리스트
        List<Integer> list2 = new ArrayList<>(List.of(2, 1, 2, 3, 3, 4, 4, 5, 5, 2));
        List<String> strList2 = new ArrayList<>(List.of("AAA","AAA","AAA","AAA","AAA"));

        // reduce : 스트림을 반복해서 연산하면서 값을 하나로 모으는 기능, BinaryOperator
        // reduce를 통한 sum 객체
        Optional<Integer> sum1 = list.stream().reduce((a,b)-> a+b);
        Optional<Integer> sum2 =  list.stream().reduce(Integer::sum);
        System.out.println("sum : "+sum1.get()+", sum2 : "+sum2.get());


        // sum, average 메소드는 inputStream, DoubleStream 등 기본형 스트림에서 존재
        // 일반 스트림에서 IntStream로 변경하는 방법
        // 인자 없이 들어갈려면 항등함수가 필요하다(x->x)
        IntStream intStream = list.stream().mapToInt(x->x); // 항등함수
        int sum = intStream.sum();
        OptionalDouble avg = list.stream().mapToInt(x->x).average();
        System.out.println("sum : " + sum);
        System.out.println("avg : " + avg.getAsDouble());
        System.out.println("\n---------------------------------------------");

        // 병렬처리로 sum 하는 방법 -> parallelStream 활용만 하면 된다.
        // -> 자동으로 Thread로 계산함으로 연산속도가 비약적으로 상승한다!
        int sum3 = list.parallelStream().reduce(0, Integer::sum);
        Optional<Integer> sum4 = list.parallelStream().reduce(Integer::sum);
        System.out.println("sum3 : " + sum3);
        System.out.println("sum4 : " + sum4.get());
        System.out.println("\n---------------------------------------------");

        // 병렬처리로 min 값 구하기
        Optional<Integer> min1 = list.parallelStream().reduce(Integer::sum);
        OptionalInt min2 = list.stream().mapToInt((x)->x).parallel().min();
        System.out.println("min1 : "+min1.get());
        System.out.println("min2 : "+min2.getAsInt());
        System.out.println("\n---------------------------------------------");


        // 병렬처리로 max 값 구하기
        Optional<Integer> max1 = list.parallelStream().reduce(Integer::sum);
        OptionalInt max2 = list.stream().mapToInt((x)->x).parallel().max();
        System.out.println("max1 : "+max1.get());
        System.out.println("max2 : "+max2.getAsInt());
        System.out.println("\n---------------------------------------------");

        // count 하기
        long count = list.stream().count();
        long count2 = list.stream().distinct().count();
        System.out.println("count : "+count);
        System.out.println("count2 : "+count2);

        // 필터 예제
        System.out.println("3 초과값만 출력하기");
        list.stream().filter(x->x>3).forEach(v->System.out.println(v+", "));
        System.out.println("\n---------------------------------------------");

        // 2단 필터링
        // 3 초과 7 미만 값
        list.stream().filter(x->3<x&&x<7).forEach(x->System.out.print(x+" "));
        System.out.println();
        // filter 2번 : 조건문은 한번에 쓸 것, 이유 : 반복을 여러번 돌기 때문에
        list.stream().filter(x->3<x).filter(x->x<7).forEach(x->System.out.print(x+ " "));
        System.out.println("\n---------------------------------------------");

        // 중복제거
        System.out.println("------------------------");
        list2.stream().distinct().forEach(System.out::println);
        System.out.println("------------------------");

        // 출력하는 방법
//     list.stream().forEach(System.out::println);
        list.stream().forEach(v -> System.out.print(v + ","));
        System.out.println();

        // 정렬하기
        list.stream().sorted().forEach(v -> System.out.print(v + ",")); // 오름차순
        System.out.println();
        list.stream().sorted(Comparator.reverseOrder())
                .forEach(v -> System.out.print(v + ",")); // 내림차순
        System.out.println();

        // 필터
        list.stream().filter(v -> v > 3)
                .forEach(v -> System.out.print(v + ","));
        System.out.println();

        // A 포함되어 있는 것들 출력
        strList1.stream().filter(str -> str.contains("A"))
                .forEach(v -> System.out.print(v + ","));
        System.out.println();

        // match : 특정한 값이 일치하는지 확인하는 방법

        // allMatch : 전체값이 모두 일치할때 사용 -> 주의필요!!
        boolean result1 = strList1.stream().allMatch(s ->  s.equals("AAA"));
        System.out.println(result1); // false
        boolean result2 = strList2.stream().allMatch(s ->  s.equals("AAA"));
        System.out.println(result2); // true

        // anyMatch : list에서 일부 값이 일치하는 문자열 찾을때 사용
        boolean result3 = strList1.stream().anyMatch(s ->  s.equals("AAA"));
        System.out.println(result3); // true
        boolean result4 = strList2.stream().anyMatch(s ->  s.equals("AAA"));
        System.out.println(result4); // true

        // anyMatch : list에서 일부 값이 일치하는 문자열 찾을때 사용
        boolean result5 = strList1.stream().anyMatch(s ->  s.contains("A"));
        System.out.println(result5); // true

        // 컬랙션으로 변경하는 방법
        // limit : 자를때 사용
        List<Integer> list3 = list.stream().sorted().limit(5).toList();
        System.out.println(list3);

    }
}
