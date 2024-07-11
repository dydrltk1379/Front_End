package q1;

import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> strings = Arrays.asList("파인애플", "송아지", "양", "스마일", "소");
        strings.stream().filter(str -> str.length() != 1).forEach(str -> System.out.print(str + ", "));

        List<String> images = Arrays.asList("1.png", "2.png", "3.jpeg", "4.jpeg");
        images.stream().filter(str -> str.endsWith(".jpeg")).forEach(str -> System.out.print(str + ", "));
    }
}
