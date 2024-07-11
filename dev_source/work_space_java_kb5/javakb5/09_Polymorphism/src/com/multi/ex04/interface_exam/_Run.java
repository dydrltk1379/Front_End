package com.multi.ex04.interface_exam;

public class _Run {
    public static void main(String[] args) {
        // 부모의 type의 array
        Car[] carArray = new Car[5];
        carArray[0] = new Avante();
        carArray[1] = new Sonata();
        carArray[2] = new Grandeur();
        carArray[3] = new BmwM5();
        carArray[4] = new TeslaModel3();

        for(Car car : carArray){
            printCar(car);
        }
    }

    public static void printCar(Car car){
        System.out.println(car.toString());
        car.move();
        // 내연기관차와 전기차 구분
        if(car instanceof ElectricType){ // 전기차 식별 코드
            ((ElectricType)car).charge(); // 충전 메소드 호출
        }else{
            car.oilling(); // 내연기관차
        }

        if(car instanceof HyundaiCar hyundaiCar){
            hyundaiCar.nickName();
            hyundaiCar.service();
            System.out.println(hyundaiCar.serviceName);
        }

        if(car instanceof BmwM5 bmwM5){
            bmwM5.BmwM5nickName();
        }

        if(car instanceof OverseasType){
            ((OverseasType)car).printOrigin();
            System.out.println(((OverseasType)car).getOrigin()+ "에서 수집되었습니다.");
        }
        System.out.println();
    }
}
