package q3;

import java.util.Arrays;
import java.util.List;
import java.util.OptionalDouble;

class Student {
    String name;
    int score;
    Student(String name, int score) {
        this.name = name;
        this.score = score;
    }
    public String getName() { return name; }
    public int getScore() { return score; }
}


public class Main {
    public static void main(String[] args) {
        List<Student> list = Arrays.asList(
                new Student("hong", 100),
                new Student("kim", 90),
                new Student("jung", 80),
                new Student("park", 70),
                new Student("moon", 95)
                );

        OptionalDouble average = list.stream().mapToInt(Student::getScore).average(); 

        if (average.isPresent()) {
            System.out.println("평균 점수: " + average.getAsDouble());
        } else {
            System.out.println("평균값을 구할 수 없음");
        }
    }
}

