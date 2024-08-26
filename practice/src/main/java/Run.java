import java.util.List;

public class Run {

    public static void main(String[] args) {
        MemberDAO dao = new MemberDAO();
        Member member = dao.selectOne(1);
        System.out.println(member);
        System.out.println("-------------------------------------------");
        List<Member> list = dao.selectAll("test", "길동");
        list.forEach(System.out::println);
        System.out.println("-------------------------------------------");

        int result = dao.insert(member);
        if(result>0){
        
    }
}
