package com.multi.ex04.interface_exam;

// 전기차에서 사용할 인터페이스
public interface ElectricType {

    // 차량의 연료 type
    String GAS_TYPE = "전기";

    // 추상 메소드
    void charge(); // 충전 기능
}
