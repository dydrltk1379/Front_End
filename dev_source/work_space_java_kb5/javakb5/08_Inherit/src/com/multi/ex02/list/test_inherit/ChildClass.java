package com.multi.ex02.list.test_inherit;

// 자식 클래스로 부모 SuperClass를 상속받은 클래스
public class ChildClass extends SuperClass {
    // 자식의 멤버변수는 부모와 이름이 겹쳐서 선언은 가능하다!
    private int privateValue = 105;
    protected int protectedValue = 110;
    public int publicValue = 120;

    public ChildClass() {
        super(); // 부모의 생성자를 명시적으로 호출하는 코드,
                 // 만일 생략하는 경우 JVM에 자동으로 생성 시켜준다.
                 // 만일 선언하는 하는 경우 생성자 가장 첫줄에 선언해야하며, 그러지 않을 경우 에러 발생! // Call to 'super()' must be first statement in constructor body
                 // 부모의 생성자를 호출하는 이유는?
                 // -> 부모의 메모리공간을 미리확보하고 자식은 그 메모리 주소에서 확장해서 다시 멤버변수가 선언되기 때문에
        System.out.println("ChildClass의 생성자 입니다.");

        // local 변수 선언 = stack에 메모리가 잡히는 변수, 호출 끝나면 같이 사라짐
        int publicValue = 300;
        // local 변수가 호출되는 영역, 호출되는 원리는? 블록={ }!
        System.out.println(publicValue);

        // 현재 클래스의 멤버변수 접근하는 방법
        // -> this 키워드 
        System.out.println("This privateValue : " + this.privateValue);
        System.out.println("This protectedValue : " + this.protectedValue);
        System.out.println("This publicValue : " + this.publicValue);

        // 부모의 멤버변수 접근하는 방법
        // -> super 키워드 활용
//        System.out.println("Super privateValue : " + super.privateValue); // 에러 발생!!
        System.out.println("Super privateValue : " + super.getPrivateValue());
        System.out.println("Super protectedValue : " + super.protectedValue);
        System.out.println("Super publicValue : " + super.publicValue);
    }

    @Override
    public void publicMethod() {
        System.out.println("ChildClass에서 오버라이드 된 publicMethod입니다.");
        super.publicMethod();   // 부모의 publicMethod를 호출하는 문장 -> 필요에 따라 삭제할수 있는 문장!
    }
}
