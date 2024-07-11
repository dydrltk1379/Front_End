package com.multi.ex06.date;

import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

// 날짜 관련 Library
public class DateTest {

    public static void main(String[] args) throws ParseException {
        // Date : java 1.0 부터 날짜 Type 활용, Calendar(보조)와 병행 사용을 권장
        // -> 1.8 이후 LocalDateTime으로 교체되고 있다.
        //  -> JSP사용하는 레거시에는 활용 불가(Date 쓴다)

         java.util.Date date1 = new java.util.Date(); // 정석
        // java.sql.Date date2 = new java.sql.Date;
        Date date = new Date();
        System.out.println(date); // 오늘 날짜, Mon Jul 08 14:35:13 KST 2024 -> 미국식 표현
        System.out.println(date.getTime()); // 1720417035749
        System.out.println(System.currentTimeMillis()); // 1720417035775
        // GMT -> 그리니치 표준시, 영국 : 0시, 우리나라 GMT+9, 9시간 시차 존재!
        // 1720417025603 -> 1970년 1월 1일 0시로부터 현재까지 흐른 ms 시차! Int 계산하기 위해서
        // 밀레니엄 버그 : short 계산떄문에, Y2K

        Date date2 = new Date(System.currentTimeMillis()); // currentTimeMillis() : os시스템의 현재 시간을 가져오는 메소드
        System.out.println(date2);
        System.out.println("-----------------------------------------");

        // Date format 바꾸는 방법 ★★★★★
        // https://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss.SSS");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 hh시간 mm분 ss초");
        // 주의점! MM: 월, mm: 분

        System.out.println(sdf1.format(new Date()));
        System.out.println(sdf2.format(new Date()));
        System.out.println("-----------------------------------------");

        // 문자열 -> 날짜로 변경하는 방법 : parse
        Date d = sdf1.parse("2024-07-08(월) 03:07:13");
        System.out.println(sdf1.format(d));


        // Calendar : Date 단점을 보완한 Library, date에서 delicate 된 메소드를 Calendar에서 사용하면 된다.
        // 특징 : 자체 생성이 불가능!!
//     Calendar cal = new Calendar(); // abstract class라 생성되지 않음
        Calendar cal = Calendar.getInstance(); // Class를 대신 생성시켜주는 생성자(factory) 패턴
        System.out.println(cal.toString().replace(",", ",\n")); // GregorianCalendar

        System.out.println(cal.get(Calendar.YEAR));
        System.out.println(cal.get(Calendar.MONTH) + 1); // +1
        System.out.println(cal.get(Calendar.DATE));
        System.out.println(cal.get(Calendar.AM_PM));
        System.out.println(cal.get(Calendar.HOUR));
        System.out.println(cal.get(Calendar.MINUTE));
        System.out.println(cal.get(Calendar.SECOND));

        String dateStr1 = sdf1.format(cal.getTime());
        String dateStr2 = sdf1.format(cal.getTimeInMillis());
        System.out.println(dateStr1);
        System.out.println(dateStr2);

        // 날짜를 지정하는 방법 : GregorianCalendar를 권장
        GregorianCalendar gc = new GregorianCalendar(2000, 5 - 1, 10); // 2000-05-10
        System.out.println(sdf1.format(gc.getTime()));

        // 날짜간 대소 비교
        System.out.println(gc.after(cal));
        System.out.println(gc.before(cal));

        // 날짜 더하기
        gc.add(Calendar.DAY_OF_MONTH, 1);
        System.out.println(sdf1.format(gc.getTime()));
        System.out.println("-------------------------------------------------");
    }
}
