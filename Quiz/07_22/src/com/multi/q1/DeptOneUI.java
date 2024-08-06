package com.multi.q1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DeptOneUI {
    public static Connection conn=null;
    public static PreparedStatement ptmt=null;
    public static ResultSet rs=null;

    public static String driverClass = "com.mysql.cj.jdbc.Driver";
    public static String url = "jdbc:mysql://localhost.3306/school2";
    public static void main(String[] args) {

    }
}
