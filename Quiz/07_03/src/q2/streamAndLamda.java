package q2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class streamAndLamda {
    public static void main(String[] args) {
        List<Integer> numbers = Arrays.asList(1,2,3,4,5);

        List<Integer> list = numbers.stream()
                .filter(w -> w > 3)
                .collect(Collectors.toList());
        System.out.println(list);

        List<Integer> list2 = numbers.stream()
                .map(num -> num * 10)
                .collect(Collectors.toList());
        System.out.println(list2);

    }
}
