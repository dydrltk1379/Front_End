package q2;

public class Main {
    public static void main(String[] args) {
        SmartPhone smartPhone = new SmartPhone(20, "red", 80);
        Tablet tablet = new Tablet(false, 70, "blue");
        Laptop laptop = new Laptop(100, "silver");
        System.out.println(smartPhone.toString());
        System.out.println(tablet.toString());
        System.out.println(laptop.toString());
    }
}
