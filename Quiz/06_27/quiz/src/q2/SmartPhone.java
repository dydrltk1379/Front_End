package q2;

public class SmartPhone extends Move{
    private int cameraResolution;

    public SmartPhone(int batteryCapacity, String color, int cameraResolution) {
        super(batteryCapacity, color);
        this.cameraResolution = cameraResolution;
    }

    public int getCameraResolution() {
        return cameraResolution;
    }

    public void setCameraResolution(int cameraResolution) {
        this.cameraResolution = cameraResolution;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("SmartPhone{");
        sb.append("cameraResolution=").append(cameraResolution);
        sb.append("batteryCapacity=").append(getBatteryCapacity());
        sb.append("} ");
        sb.append(super.toString());
        return sb.toString();
    }
}
