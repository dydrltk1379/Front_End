package com.multi.ex04.interface_exam;

public class BmwM5 extends Car implements OverseasType{
    public BmwM5(){
        super("BmwM5", 4395);
    }

    @Override
    public void oilling() {
        System.out.println("고급 휘발유를 주유중입니다.");
    }

    @Override
    public void move() {
        System.out.println("부아아앙앙(시끄럽다)");
    }

    public void BmwM5nickName(){
        System.out.println("운전습관이 좋지 않을 가능성이 높은 차");
    }

    @Override
    public String getOrigin() {
        return "germany";
    }
}