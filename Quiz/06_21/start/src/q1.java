import java.util.Scanner;

public class q1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        Id id = new Id();

        System.out.println("ID를 입력하세요: ");
        id.setId(sc.nextLine());
        System.out.println("비밀번호를 입력하세요: ");
        id.setPassword(sc.nextLine());
        if(id.getId().equals("root") && id.getPassword().equals("1234")){
            System.out.println("일기 작성을 시작합니다.");
            System.out.println("제목을 입력하세요:");
            id.setTitle(sc.nextLine());
            System.out.println("내용을 입력하세요:");
            id.setContext(sc.nextLine());
            System.out.println("일기가 저장되었습니다 : (파일명.txt)");

        }else{
            System.out.println("ID 또는 비밀번호가 잘못되었습니다.");
        }
    }
}

class Id{
    private String id;
    private String password;
    private String title;
    private String context;

    public Id(){
    }

    public Id(String id, String password){
        this.id = id;
        this.password = password;
    }

    public Id(String id, String password, String title, String context){
        this.id = id;
        this.password = password;
        this.title = title;
        this.context = context;
    }

    public String getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public String getTitle() {
        return title;
    }

    public String getContext() {
        return context;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContext(String context) {
        this.context = context;
    }
}