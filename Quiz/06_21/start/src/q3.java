import java.util.Arrays;

public class q3 {
    public static void main(String[] args) {
        Student st1 = new Student(1, "Kim", 1, "Programming");
        Student st2 = new Student(1, "Park", 1, "Programming");
        Subject su1 = new Subject("Java",90);
        Subject su2 = new Subject("Python",95);
        Course course = new Course();
        course.addStduent(st1);
        course.addStduent(st2);
        course.addSubject(su1);
        course.addSubject(su2);
        course.printCourseInfo();
    }
}

class Student{
    int id;
    String name;
    int grade;
    String department;

    public Student() {
    }

    public Student(int id, String name, int grade, String department) {
        this.id = id;
        this.name = name;
        this.grade = grade;
        this.department = department;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getGrade() {
        return grade;
    }

    public String getDepartment() {
        return department;
    }
}

class Subject{
    String name;
    int score;

    public Subject() {
    }

    public Subject(String name, int score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public int getScore() {
        return score;
    }
}

class Course{
    String courseName;
    int maxStudents = 5;
    int currentStudents;
    String[] students={};
    String[] subjects={};

    public Course() {
    }

    public Course(String courseName, int maxStudents, int currentStudents, String[] students, String[] subjects) {
        this.courseName = courseName;
        this.maxStudents = maxStudents;
        this.currentStudents = currentStudents;
        this.students = students;
        this.subjects = subjects;
    }

    public int getCurrentStudents() {
        return currentStudents;
    }

    public void setCurrentStudents(int currentStudents) {
        this.currentStudents = currentStudents;
    }

    void addStduent(Student student){
        students = Arrays.copyOf(students, students.length + 1);
        students[students.length - 1] = student.name;
        courseName=student.department;
        setCurrentStudents(students.length);
    }

    void addSubject(Subject subject){
        subjects = Arrays.copyOf(subjects, subjects.length + 1);
        subjects[subjects.length - 1] = subject.name;
    }

    void printCourseInfo(){
        System.out.println("Course Name: " + courseName);
        System.out.println("Max Students: " + maxStudents);
        System.out.println("Current Students: " + currentStudents);
        for(String s : students){
            System.out.println("Stduent: "+ s+ " - Computer Science");
        }
        for(String s : subjects){
            System.out.println("Subject: "+ s);
        }
    }
}