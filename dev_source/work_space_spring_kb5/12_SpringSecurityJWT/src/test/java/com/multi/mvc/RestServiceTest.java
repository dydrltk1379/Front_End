package com.multi.mvc;

import com.multi.mvc.rest.model.vo.Cat;
import com.multi.mvc.rest.service.CatService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

// Spring Framework + Junit5 활용방법
// https://velog.io/@hjkwon0814/Spring-Framework%EC%97%90%EC%84%9C-JUnit5-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0

// 테스트 커버리지
// https://velog.io/@newdana01/Test-%ED%85%8C%EC%8A%A4%ED%8A%B8-%EC%BB%A4%EB%B2%84%EB%A6%AC%EC%A7%80-Test-Coverage

// 회귀테스트 이론
// https://velog.io/@dahunyoo/Regression-Test

@WebAppConfiguration // main 시작
@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
                        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class RestServiceTest {

    @Autowired
    CatService service;

    @Test
    public void test() {
        List<Cat> list = service.selectAll();
        for (Cat cat : list) {
            System.out.println(cat);
        }
        // assert : 항상 참이어야 테스트가 통과한다.
        assert !list.isEmpty();

        List<Cat> list2 = service.selectByName("메인쿤");
        for (Cat cat : list2) {
            System.out.println(cat);
        }
        assert !list2.isEmpty();

        List<Cat> list3 = service.selectByName("샴");
//        assert !list3.isEmpty(); // 에러 케이스! 통과하지 못하면 테스트 에러가 발생한다.

    }
}
