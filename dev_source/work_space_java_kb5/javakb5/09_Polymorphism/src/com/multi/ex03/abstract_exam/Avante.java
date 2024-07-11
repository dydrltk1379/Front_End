package com.multi.ex03.abstract_exam;

// 상속 초기에 에러가 발생한다.
// 'com.multi.ex02.poly_exam.Car'에 사용 가능한 매개변수가 없는 생성자가 없습니다
public class Avante extends HyundaiCar {

    // 인자 있는 생성자를 자동 생성
//    public Avante(String name, int oc) {
//        super(name, oc);
//    }

    // 이름 없는 생성자를 만들 때 에러 발생 -> super()로 선언되어 에러
    public Avante() {
//        super();
        super("아반떼", 1600); // 아벤떼, 1600 정보 입력
    }

    @Override
    public void oilling() {
        System.out.println("휘발유를 주유합니다.");
    }

    @Override
    public void nickName() {
        System.out.print("아방이");
    }
}
