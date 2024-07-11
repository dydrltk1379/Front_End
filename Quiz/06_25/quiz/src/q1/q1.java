package q1;

public class q1 {
    public static void main(String[] args) {
        Day[] days = new Day[3];
        days[0] = new Day("자바공부", 10, "강남");
        days[1] = new Day("자바공부", 10, "강남");
        days[2] = new Day("자바공부", 10, "강남");

        System.out.println("전체 하는 일의 시간은 : "+Day.totalTime);
        System.out.println("평균 하는 일의 시간은 : "+Day.getAvg());
        System.out.println("매일 무엇을 얼마나 어디에서 했는지 프린트 : ");
        for(Day d : days){
            System.out.println(d.toString());
        }
    }
}

