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

        member.setName("홍박이길동");
        member.setId("test12879109");
        int result = dao.insert(member);
        if(result > 0){
            System.out.println("성공");
        }else {
            System.out.println("실패");
        }
        
    }
}
