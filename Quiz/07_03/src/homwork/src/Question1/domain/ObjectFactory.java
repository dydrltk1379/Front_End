package Question1.domain;

public class ObjectFactory {

    // 리플렉션을 통한 생성자 자동으로 만들어주는 코드
    // -> 아래 코드는 여기서 유지보수 하지 않는다. Type만 관리되면 된다.
    // -> 또한 Type check를 강력하게 할수 있어 편리하다.
    public static Object createProduct(ObjectType type){
        Object product = null;
        try {
            Object obj = type.productClass().getDeclaredConstructors()[0].newInstance();
            System.out.println(type.productClass().getDeclaredConstructors()[0].newInstance().getClass());
//            System.out.println(obj.getClass());

            return obj;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
