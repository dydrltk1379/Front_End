package q2;

public class Tablet extends Move{
    private boolean isConnected;

    public Tablet(boolean isConnected, int batteryCapacity, String color) {
        super(batteryCapacity, color);
        this.isConnected = isConnected;
    }

    public boolean isConnected() {
        return isConnected;
    }

    public void setConnected(boolean connected) {
        isConnected = connected;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Tablet{");
        sb.append("isConnected=").append(isConnected);
        sb.append("} ");
        sb.append(super.toString());
        return sb.toString();
    }
}
