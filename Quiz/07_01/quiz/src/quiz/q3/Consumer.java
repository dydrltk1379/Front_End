package quiz.q3;

import quiz.q1.Member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Consumer {
    public static void main(String[] args) {
        Map<Integer, String> map = new HashMap<>();
        map.put(100, "김데이");
        map.put(200, "김사전");
        map.put(300, "김구조");
        map.put(400, "김자료");

        map.remove(200);
        map.put(300, "김충성");
        System.out.println("고객의 전체 리스트 : ");
        for(Map.Entry<Integer, String> entry : map.entrySet()){
            System.out.println("고객 번호 : " + entry.getKey() + ", 이름 :" + entry.getValue());
        }

    }
}
