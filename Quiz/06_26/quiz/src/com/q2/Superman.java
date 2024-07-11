package com.q2;

public class Superman extends Man {
    boolean sky;

    public Superman(String name, int age, int power, boolean sky) {
        super(name, age, power);
        this.sky = sky;
    }

    public void space(){
        System.out.println(name+"이(가) 우주를 날아갑니다.");
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Superman [");
        sb.append("sky=").append(sky);
        sb.append(", power=").append(power);
        sb.append(", name='").append(name).append('\'');
        sb.append(", age=").append(age);
        sb.append(", sky=").append(sky);
        sb.append(']');
        return sb.toString();
    }
}
