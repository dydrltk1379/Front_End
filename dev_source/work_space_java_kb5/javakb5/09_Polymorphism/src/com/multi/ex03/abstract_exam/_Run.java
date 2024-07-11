package com.multi.ex03.abstract_exam;

public class _Run {
    public static void main(String[] args) {
        // 부모의 type의 array
        Car[] carArray = new Car[4];
        carArray[0] = new Avante();
        carArray[1] = new Sonata();
        carArray[2] = new Grandeur();
        carArray[3] = new BmwM5();

        for(Car car : carArray){
            printCar(car);
        }
    }

    public static void printCar(Car car){
        System.out.println(car.toString());
        car.move();
        car.oilling();

        if(car instanceof HyundaiCar hyundaiCar){
            hyundaiCar.nickName();
            hyundaiCar.service();
            System.out.println(hyundaiCar.serviceName);
        }

        if(car instanceof BmwM5 bmwM5){
            bmwM5.BmwM5nickName();
        }
        System.out.println();
    }
}
