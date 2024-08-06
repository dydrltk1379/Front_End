package com.multi.q1;

import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.ArrayList;

public class DeptListUI {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        DeptDAO dao = new DeptDAO();

        ArrayList<DeptVO> list = dao.list();
        for (DeptVO dept : list) {
            System.out.println("검색 결과>> deptNo = " + dept.getDEPTNO());
            System.out.println("검색 결과>> deptName = " + dept.getDNAME());
            System.out.println("검색 결과>> Loc = " + dept.getLOC());
            System.out.println("--------------------------------------");
        }
    }
}
