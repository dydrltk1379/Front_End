package q2;

import java.util.Scanner;

public class q2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Account[] accounts = new Account[3];
        boolean check=true;
        while(check){
            System.out.println("-----------------------------------------------");
            System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5. 종료");
            System.out.println("-----------------------------------------------");
            System.out.print("선택>");
            int choice = sc.nextInt();
            switch(choice){
                case 1:
                    System.out.println("-------");
                    System.out.println("계좌생성");
                    System.out.println("-------");

                    System.out.print("계좌번호: ");
                    String count = sc.next();
                    System.out.print("계좌주: ");
                    String name = sc.next();
                    System.out.print("초기입금액: ");
                    int money = sc.nextInt();

                    accounts[Account.getCnt()] = new Account(count, name, money);
                    Account.setCnt(Account.getCnt()+1);
                    System.out.println("결과: 계좌가 생성되었습니다.");
                    break;
                case 2:
                    System.out.println("-------");
                    System.out.println("계좌목록");
                    System.out.println("-------");
                    for(int i=0; i<Account.getCnt(); i++){
                        System.out.println(accounts[i].toString());
                    }
                    break;
                case 3:
                    System.out.println("-------");
                    System.out.println("예금");
                    System.out.println("-------");
                    System.out.print("계좌번호: ");
                    String count2 = sc.next();
                    System.out.print("예금액 : ");
                    int money2 = sc.nextInt();
                    for(int i=0; i<accounts.length; i++){
                        if(accounts[i].getCount().equals(count2)){
                            accounts[i].setMoney(accounts[i].getMoney()+money2);
                            break;
                        }
                    }
                    break;
                case 4:
                    System.out.println("-------");
                    System.out.println("출금");
                    System.out.println("-------");
                    System.out.print("계좌번호: ");
                    String count3 = sc.next();
                    System.out.print("출금액: ");
                    int money3 = sc.nextInt();
                    for(int i=0; i<accounts.length; i++){
                        if(accounts[i].getCount().equals(count3)){
                            accounts[i].setMoney(accounts[i].getMoney()-money3);
                            break;
                        }
                    }
                    System.out.println("결과: 출금이 성공되었습니다.");
                    break;
                case 5:
                    check=false;
                    System.out.println("프로그램 종료");
                    break;
            }
        }
    }
}
