package q2;

public class Laptop extends Move{
    public Laptop(int batteryCapacity, String color) {
        super(batteryCapacity, color);
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Laptop{");
        sb.append("batteryCapacity=").append(getBatteryCapacity());
        sb.append("} ");
        sb.append(super.toString());
        return sb.toString();
    }
}
