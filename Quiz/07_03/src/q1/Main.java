package q1;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while(true){
            System.out.print("어떤 객체를 생성하시겠습니까? (Apple, Banana, Ice) :");
            String input = sc.nextLine();

            if(input.equals("exit")){
                System.out.println("프로그램을 종료합니다.");
                break;
            }
            Object obj = ObjectFactory.createProduct(ObjectType.valueOf(input));
            if(obj!=null){
                System.out.println(input+"가(이) 입력되었습니다.\n");
            }
        }
    }
}
