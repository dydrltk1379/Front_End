package com.multi.ex03.set;

import java.util.Objects;

// 은행정보 (계좌 잔액 포함됨)
public class Member2 implements Comparable<Member2> {
    private String id;
    private String name;
    private int age;
    private double account; // 계좌 잔액

    public Member2() {
    }

    public Member2(String id, String name, int age, double account) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.account = account;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getAccount() {
        return account;
    }

    public void setAccount(double account) {
        this.account = account;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Member2 member2 = (Member2) o;
        return age == member2.age && Double.compare(account, member2.account) == 0 && Objects.equals(id, member2.id) && Objects.equals(name, member2.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, age, account);
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Member2{");
        sb.append("id='").append(id).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", age=").append(age);
        sb.append(", account=").append(account);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public int compareTo(Member2 o) {
        // id 기준으로 오름차순 정렬 구현하는 방법
        return id.compareTo(o.id); // compareTo : 작으면 -1, 같으면 0, 크면 1

        // id 기준으로 내림차순 정렬 구현하는 방법
        // return o.getId().compareTo(o.id);
    }
}
