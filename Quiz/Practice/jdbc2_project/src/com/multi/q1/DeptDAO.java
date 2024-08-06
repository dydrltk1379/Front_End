package com.multi.q1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeptDAO {
    private static Connection conn = null;
    private static PreparedStatement ptmt = null;
    private static ResultSet rs = null;

    private static String driverClass = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/school2";
    private static String user = "root";
    private static String password = "1234";

    public DeptVO one(int deptNo) {
        try{
            Class.forName(driverClass);
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);

            String sql = "select * from dept where deptno = ?";
            ptmt = conn.prepareStatement(sql);
            ptmt.setInt(1, deptNo);
            rs = ptmt.executeQuery();

            DeptVO dept = null;
            if(rs.next()){
                int cnt=1;
                int DEPTNO = rs.getInt(cnt++);
                String DNAME = rs.getString(cnt++);
                String LOC = rs.getString(cnt++);
                dept =new DeptVO(DEPTNO, DNAME, LOC);
            }
            ptmt.close();
            rs.close();
            return dept;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }
    public ArrayList<DeptVO> list() {
        try{
            Class.forName(driverClass);
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);

            String sql = "select * from dept";
            ptmt = conn.prepareStatement(sql);
            rs = ptmt.executeQuery();

            ArrayList<DeptVO> dept = new ArrayList<>();
            while(rs.next()){
                int deptno = rs.getInt(1);
                String DNAME = rs.getString(2);
                String LOC = rs.getString(3);
                dept.add(new DeptVO(deptno, DNAME, LOC));
            }
            ptmt.close();
            rs.close();
            return dept;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
