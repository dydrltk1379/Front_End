package Question1;

import Question1.domain.ObjectFactory;
import Question1.domain.ObjectType;
import Question1.input.InputObject;

import java.io.IOException;

import java.util.Arrays;
import java.util.Optional;

public class Main {

    public static void main(String[] args) throws IOException {

        while(true) {
            String type = InputObject.inputObject();
            Optional<Object> object = ObjectType objectType = Arrays.stream(ObjectType.values())
                    .filter(ot -> type.equals(ot.getName()))
                    .findFirst();
            ObjectFactory.createProduct(objectType);
        }
    }
}
