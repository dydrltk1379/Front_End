package Question3;

import java.util.*;

public class Main {

    public static void main(String[] args) {

        List<String> words = Arrays.asList("hello", "Hi", "smile");

        List<String> li = words.stream()
                .filter(v -> v.length() >= 4)
                .map(String::toUpperCase)
                .toList();
        System.out.println(li);

        words.replaceAll((v) -> v+"님");
        System.out.println(words);
    }
}
