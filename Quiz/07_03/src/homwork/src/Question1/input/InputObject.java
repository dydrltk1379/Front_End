package Question1.input;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class InputObject {
    private static final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    private static final String CHOOSE_PRODUCT = "어떤 객체를 생성하시겠습니까? (Apple, Banana, Ice): ";
    private static final String EXIT_MESSAGE = "프로그램을 종료합니다.";

    public static String inputObject() throws IOException {
        System.out.print(CHOOSE_PRODUCT);
        String input = br.readLine();
        validateInput(input);
        return input;
    }

    public static boolean validateInput(String input) {
        if(input.equals("exit")) {
            System.out.println(EXIT_MESSAGE);
            System.exit(0);
        }
        return true;
    }
}
