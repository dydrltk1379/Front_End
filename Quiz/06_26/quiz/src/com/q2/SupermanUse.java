package com.q2;

public class SupermanUse {
    public static void main(String[] args) {
        Superman superman = new Superman("클라크 켄트", 30, 100, true);
        superman.eat();
        superman.run();
        superman.space();
        System.out.println(superman.toString());
    }
}
