package com.q1;

public class Employee {
    public String name;
    String address;
    protected int salary;
    private int rrn;

    public Employee(String name, String address, int salary, int rrn) {
        this.name = name;
        this.address = address;
        this.salary = salary;
        this.rrn = rrn;
    }

    public Employee() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getRrn() {
        return rrn;
    }

    public void setRrn(int rrn) {
        this.rrn = rrn;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Employee [");
        sb.append("name='").append(name).append('\'');
        sb.append(", address='").append(address).append('\'');
        sb.append(", salary=").append(salary);
        sb.append(", rrn=").append(rrn);
        sb.append(']');
        return sb.toString();
    }
}
