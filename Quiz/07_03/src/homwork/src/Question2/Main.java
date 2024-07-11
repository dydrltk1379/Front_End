package Question2;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Main {

    public static void main(String[] args) {
        printExceed3();
        printMultiple10();

    }
    public static void printExceed3() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);

        List<Integer> numbersGreaterThan3 = numbers.stream()
                .filter(num -> num > 3)
                .collect(Collectors.toList());

        System.out.println(numbersGreaterThan3);

    }

    public static void printMultiple10() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);

        List<Integer> multipliedNumbers = numbers.stream()
                .map(num -> num * 10)
                .collect(Collectors.toList());

        System.out.println(multipliedNumbers);
    }
}
