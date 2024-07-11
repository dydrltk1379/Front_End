package q1;

public class ObjectFactory {
    /*
    public Object createObject(String objectType) {

        if(objectType.equals("Apple")) {
            return  new AppleClass();
        }else if(objectType.equals("Banana")) {
            return new BananaClass();
        }else if (objectType.equals("Ice")) {
            return new IceClass();
        }
        return null;
    }
    */
    public static Object createProduct(ObjectType type){
        Object product = null;
        try {
             Object obj = type.productClass().getDeclaredConstructors()[0].newInstance();
             product = (Object) obj;
            System.out.println(obj.getClass());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return product;
    }
}
