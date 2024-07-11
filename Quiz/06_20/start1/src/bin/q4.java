package bin;

import java.util.*;

public class q4 {
    public static void main(String[] args) {
       Scanner s = new Scanner(System.in);
       Item[] it = new Item[3];
       int i=-1;
       while(true){
           System.out.println("메뉴 번호를 입력, 3개 모두 주문 완료되었으면 'x'입력 : ");
           String x = s.nextLine();
           i++;

           if(x.equals("1")){
               it[i] = new Item("Burger", 5.99);
           }else if(x.equals("2")){
               it[i] = new Item("Fries", 2.99);
           }else if(x.equals("3")){
               it[i] = new Item("Soda", 1.99);
           }
           if(x.equals("x")||i==2){
               System.out.println("프로그램을 종료합니다.");
               break;
           }
           System.out.println("주문 가능한 메뉴입니다.");
           System.out.println("======================");
           System.out.println("1>> Burger: $5.99");
           System.out.println("2>> Fries: $2.99");
           System.out.println("3>> Soda: $1.99");
       }
       System.out.println("\nYour order: ");
       for(Item member:it){
           System.out.println(member.getName()+": "+member.getPrice());
       }
    }
}
class Item{
    private String name;
    private double price;

    public Item(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }
}
