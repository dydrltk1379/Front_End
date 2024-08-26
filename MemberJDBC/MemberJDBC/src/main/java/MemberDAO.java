import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MemberDAO {
    public static String driverClass = "com.mysql.cj.jdbc.Driver";
    public static String url = "jdbc:mysql://localhost:3306/jdbc";
    public static String user = "user";
    public static String password = "1234";
    private Connection conn = null;

    public MemberDAO() {
        try {
            Class.forName(driverClass);
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public Member selectOne(int no) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from member where mno = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, no);
            rs = ps.executeQuery();
            if (rs.next()) {
                int mno = rs.getInt("mno");
                String id = rs.getString("id");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                int age = rs.getInt("age");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String hobby = rs.getString("hobby");
                Date birthday = rs.getDate("birthday");
                Date enrolldate = rs.getDate("enrolldate");
                return new Member(mno, id, password, name, gender, age, email, phone, address, hobby, birthday, enrolldate);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return null;
    }

    public List<Member> selectAll(String memberId, String memberName) {
        List<Member> list = new ArrayList<Member>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from member where id like ? and name like ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + memberId + "%"); // test
            ps.setString(2, "%"+memberName+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int mno = rs.getInt("mno");
                String id = rs.getString("id");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                int age = rs.getInt("age");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String hobby = rs.getString("hobby");
                Date birthday = rs.getDate("birthday");
                Date enrolldate = rs.getDate("enrolldate");
                Member member = new Member(mno, id, password, name, gender, age, email, phone, address, hobby, birthday, enrolldate);
                list.add(member);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return list;
    }

    public int insert(Member m) {
        PreparedStatement pstmt = null;
        try {
            String sql = "INSERT INTO MEMBER VALUES(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, m.getId());
            pstmt.setString(2, m.getPassword());
            pstmt.setString(3, m.getName());
            pstmt.setString(4, m.getGender());
            pstmt.setInt(5, m.getAge());
            pstmt.setString(6, m.getEmail());
            pstmt.setString(7, m.getPhone());
            pstmt.setString(8, m.getAddress());
            pstmt.setString(9, m.getHobby());
            pstmt.setDate(10, new java.sql.Date(m.getBirthday().getTime()));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if(pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
