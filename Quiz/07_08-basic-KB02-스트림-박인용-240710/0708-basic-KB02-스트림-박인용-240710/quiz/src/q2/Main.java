package q2;

import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 3, 4, 4, 5, 5, 6, 8};

        System.out.println("1");
        Arrays.stream(arr).filter(str -> (str > 3)).forEach(str -> System.out.print(str + ", "));

        double[] arr2 = {5.0, 3.0, 1.0, 33.0, 35.0};
        double ans = Arrays.stream(arr2).sum();
        System.out.println("2")
        System.out.println(ans);

        String[] arr3 = {"정신과", "내과", "신경과", "정형외과"};
        
        System.out.println("3")
        Arrays.stream(arr3).forEach(str -> System.out.print(str + " 사무실 "));

    }
}
