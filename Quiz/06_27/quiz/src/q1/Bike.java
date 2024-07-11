package q1;

public class Bike extends Vehicle {
    private boolean hasCarrier;

    public Bike(String brand, String model, boolean hasCarrier) {
        super(brand, model);
        this.hasCarrier = hasCarrier;
    }

    public void hasCarrier(){
        hasCarrier = true;
    }

    @Override
    public void display() {
        super.display();
        System.out.println("Has Carrier: " + hasCarrier);
    }
}
