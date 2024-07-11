package com.q1;

public class Main {
    public static void main(String[] args) {
        Computer[] computer = new Computer[2];
        computer[0] = new AppleComputer();
        computer[1] = new BananaComputer();

        computer[0].start();
        computer[0].shutdown();
        computer[0].restart();

        computer[1].start();
        computer[1].shutdown();
        computer[1].restart();
    }
}
