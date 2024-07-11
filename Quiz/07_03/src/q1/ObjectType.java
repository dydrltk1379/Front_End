package q1;

public enum ObjectType {
    Apple(Apple.class, "Apple"), Banana(Banana.class, "Banana"), Ice(Ice.class, "Ice");

    private final Class<?> productClass;
    private final String name;

    ObjectType(Class<?> productClass, String name) {
        this.productClass = productClass;
        this.name = name;
    }

    public Class<?> productClass() {
        return productClass;
    }

    public String getName() {
        return name;
    }
}
