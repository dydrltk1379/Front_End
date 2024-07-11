package quiz.q1;

import java.util.ArrayList;
import java.util.List;

public class Run {
    public static void main(String[] args) {
        Member[] members = new Member[4];
        members[0] = new Member("박소정", 1);
        members[1] = new Member("김경민", 2);
        members[2] = new Member("소지현", 3);
        members[3] = new Member("김개빈", 4);

        List<String> strList = new ArrayList<>();
        for(Member m:members){
            strList.add(m.getName());
        }
        System.out.println("초기 참가자 목록 : " + strList);
        strList.remove("박소정");
        System.out.println("탈락 후 참가자 목록 : " + strList);
        for(String s:strList){
            System.out.println(members[strList.indexOf(s)].getRank()+"등 : " + s);
        }
    }
}
