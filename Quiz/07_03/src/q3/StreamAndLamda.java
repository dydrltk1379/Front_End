package q3;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StreamAndLamda {
    public static void main(String[] args) {
        List<String> words = Arrays.asList("hello", "Hi", "smile");

        List<String> list = words.stream()
                .filter(w -> w.length() > 4)
                .map(String::toUpperCase)
                .collect(Collectors.toList());
        System.out.println(list);

        List<String> list2 = words.stream()
                .map(w -> w + "님")
                .collect(Collectors.toList());
        System.out.println(list2);
    }
}