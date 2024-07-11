package Question1.domain;

public enum ObjectType {
    APPLE(Apple.class, "Apple"), BANANA(Banana.class, "Banana"), ICE(Ice.class , "Ice");

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
