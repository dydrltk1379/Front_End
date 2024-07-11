package quiz.q2;

import java.util.ArrayList;
import java.util.List;

public class Subject {
    public static void main(String[] args) {
        List<String> strList = new ArrayList<>(List.of("국어", "수학", "영어", "컴퓨터"));
        int n=strList.size();
        for(int i=0; i<n; i++){
            System.out.println(strList);
            strList.remove(0);
        }

    }
}
