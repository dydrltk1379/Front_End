package com.multi.aop.aspect;


import com.multi.aop.model.vo.Member;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.util.Arrays;

@Component // 해당 객체를 bean으로 생성시키는 어노테이션
@Aspect // AOP 사용시 해당 클래스가 advice(실행함수)임을 알리는 어노테이션
public class BasicAdvice {
    // Spring AOP는 패키지 + 클래스의 메소드 단위로 컨트롤이 가능하다.

	/*
	 *  AOP @Pointcut 내부 문법 정리
		execution(public Integer com.edu.aop.*.*(*))
		 - com.edu.aop 패키지에 속해있고, 파라미터가 1개인 모든 메서드, 리턴값은 Integer

		execution(* com.multi..*.get*(..))
		 - com.multi 패키지 및 하위 패키지에 속해있고, 이름이 get으로 시작하는 파라미터가 0개 이상인 모든 메서드

		execution(* com.multi.aop..*Service.*(..))
		 - com.multi.aop 패키지 및 하위 패키지에 속해있고, 이름이 Service로 끝나는 인터페이스의 파라미터가 0개 이상인 모든 메서드

		execution(* com.multi.aop.BoardService.*(..))
		 - com.multi.aop.BoardService class에 속한 파마리터가 0개 이상인 모든 메서드

		execution(* some*(*, *))
		 - 메소드 이름이 some으로 시작하고 파라미터가 2개인 모든 메서드

	     * : 와일드 카드
	 */

    // @Pointcut : AOP 대상 메소드를 지정하는 어노테이션
    @Pointcut("execution(* com.multi.aop.service.MemberService.*(..))")
    public void allPointCut(){
//        System.out.println("동작하지 않는 메소드!");
    }

    //    @Before : AOP 대상 메소드가 호출되기 이전에 실행되는 advice=메소드
//    @Before("allPointCut()") // @Pointcut에 해당되는 메소드 이름으로 joinpoint를 지정하는 방법
    @Before("execution(* com.multi.aop.service.MemberService.*(..))")
    public void printBeforeLog(JoinPoint joinPoint){ // joinPoint: 대상 메소드의 정보를 가지고 있는 객체
        System.out.println("@Before : " + joinPoint.getSignature().getName() +"() 호출됨");
        System.out.println("@Before arg : " + Arrays.toString(joinPoint.getArgs()) );
    }


    //	@After : 대상 메소드가 실행되고 이후에 호출되는 advice
    // -> 대상 메소드의 파리미터를 가져올수 없다는 단점 존재
    @After("allPointCut()")
    public void printAfterLog(JoinPoint jp) {
        System.out.println("@After : " + jp.getSignature().getName()+"() 호출됨");
    }

    //@AfterReturning : 메소드가 호출된 이후에 리턴 될때 호출되는 advice, 대상 메소드가 종료되기 이전에 호출
    // After보다 빨리 호출되고, 리턴값을 가지고 올수 있다. // 예외가 발생한 경우 호출되지 않음★★★★★
//	public int test() {
//		int result = 5;
//		...
//		return /* @AfterReturning이 호출되는 시점! 리턴 바로 직전*/ result;
//	}
    @AfterReturning(pointcut = "allPointCut()", returning = "returning")
    public void printAfterReturningLog(JoinPoint jp, Object returning) {
        System.out.println("@AfterReturning : " + jp.getSignature().getName()+"() 호출됨");

        if(returning != null && returning instanceof Member) {
            Member m = (Member)returning;
            System.out.println("@AfterReturning returning : " + m.toString());
        }
    }

    // @AfterThrowing : 메소드에서 예외가 발생하여 에러가 던져졌을때 호출되는 메소드
    @AfterThrowing(pointcut = "allPointCut()", throwing = "exception")
    public void printErrorLog(JoinPoint jp, Exception exception) {
        System.out.println("@AfterThrowing : " + jp.getSignature().getName() +"() 호출됨");
        exception.printStackTrace();
    }

    // @Around : 대상 메소드가 호출되기 전과 후에 처리할수 있는 advice
    @Around("allPointCut()")
    public Object aroundAdvice(ProceedingJoinPoint pjp) throws Throwable {
        // 실행 전
        System.out.println("@Around 실행 전 : " + pjp.getSignature().getName() + "() 호출됨");

        StopWatch watch = new StopWatch();
        watch.start();

        // 사용자의 메소드를 호출(실행)하고 리턴값을 obj로 받아오는 코드
        Object obj = pjp.proceed();

        watch.stop();

        // 실행 후
        System.out.println("@Around 실행 후 : " + pjp.getSignature().getName() + "() 호출됨");
        System.out.println("@Around 메소드 실행 시간 : " + watch.getTotalTimeMillis() + "ms초");
        System.out.println("@Around 메소드 실행 시간 : " + watch.getTotalTimeNanos() + "ns초");

        // 실행된 메소드의 리턴값을 리턴한다.
        return obj;
    }

}







