package com.multi.ex04.interface_exam;

public class Grandeur extends HyundaiCar {

    public Grandeur(){
        super("그랜저", 3000); // 3000cc;
    }

    @Override
    public void oilling() {
        System.out.println("휘발유를 주유합니다.");
    }

    @Override
    public void move() {
        System.out.println("(조용히) 위이이이이이잉");
    }

    @Override
    public void nickName() {
        System.out.println("각그렌저");
    }
}
