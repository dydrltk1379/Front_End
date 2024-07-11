package com.q2;

public class Man extends Person {
    int power;

    public Man(String name, int age, int power) {
        super(name, age);
        this.power = power;
    }

    public int getAge() {
        return power;
    }

    public void setAge(int age) {
        this.power = age;
    }

    public void run(){
        System.out.println(name+"이(가) 빠르게 달립니다.");
    }
}
