package q1;

public class Day {
    String work;
    int time;
    String place;
    static int cnt;
    static int totalTime;

    public Day() {
    }

    public Day(String work, int time, String place) {
        this.work = work;
        this.time = time;
        this.place = place;
        cnt++;
        totalTime+=time;
    }

    public static double getAvg(){
        return totalTime/(double)cnt;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Day{");
        sb.append("work='").append(work).append('\'');
        sb.append(", time=").append(time);
        sb.append(", place='").append(place).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
