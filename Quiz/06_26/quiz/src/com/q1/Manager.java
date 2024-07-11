package com.q1;

public class Manager extends Employee{
    private int bonus;

    public Manager() {
        super();
    }

    public Manager(String name, String address, int salary, int rrn, int bonus) {
        super(name, address, salary, rrn);
        this.bonus = bonus;
    }

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

    public void test(){
        StringBuilder sb = new StringBuilder(super.toString());
        sb.append(", Manager [bonus=" + bonus+"]");
        System.out.println(sb);
        System.out.println("This is a test Method in the Manager class");
    }
}
