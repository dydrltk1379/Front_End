package com.multi.q1;

import java.util.List;
import java.util.Scanner;

public class DeptOneUI {
    public static void main(String[] args) {
        try{
            Scanner sc = new Scanner(System.in);
            System.out.print("deptNo>> ");
            int deptNo = sc.nextInt();

            DeptDAO dao = new DeptDAO();
            DeptVO deptVo = dao.one(deptNo);
            System.out.println("검색결과>> deptNo = " + deptVo.getDEPTNO());
            System.out.println("검색결과>> deptName = " + deptVo.getDNAME());
            System.out.println("검색결과>> Loc = " + deptVo.getLOC());

        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}
