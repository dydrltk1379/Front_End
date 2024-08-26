package com.multi.mvc.member.controller;


// ■ Controller 주요 개념 정리
//  1. 핸들러 메소드의 URL 맵핑 관련 어노테이션 정리
//   1) @RequestMapping
//    - 개념 : 가장 기본적인 Spring의 url mapping 어노테이션, get/post 둘 다 처리 가능함
//    - 속성 값이 없을 때 : 값은 url을 나타내고, get/post를 둘다 처리할때 사용
//    - value : 맵핑할 URL을 지정하는 속성, '/'를 생략 가능, 여러개의 url을 지정할수 있음
//    - method : get, post 중 지정하는 속성, 지정하지 않은 경우 get, post 둘다 처리
//    - ex)
//      @RequestMapping("home.do")
//      @RequestMapping(value="home.do")
//      @RequestMapping(value="home.do", method="RequestMethod.GET")
//      @RequestMapping(value={"home.do", "index.do"}, method={RequestMethod.GET, RequestMethod.POST})
//
//   2) @GetMapping = REST 전용으로 만들어짐
//    - get 방식만 URL을 맵핑할때 사용됨
//      @GetMapping("getHome.do")
//
//   3) @PostMapping
//     - post 방식만 URL을 맵핑할때 사용됨
//      @PostMapping("/postHome.do")
//
//
//  2. 핸들러 메소드 주요 파라미터(매개 변수, Parameter, 인자) 정리
//    - 사용자가 선택적으로 핸들러 메소드의 파라미터를 정의하면 Spring은 요청한 파라미터에 따라
//    	자동으로 파라미터의 값을 주입(injection)하는 메커니즘
//    - Request에서 파라미터을 받은 경우 기본적인 Type은 문자열이지만,
//      사용자가 파라미터를 정의하면 정의한 Type으로 자동 변환해준다.(type converter)
//
//    1) HttpServletRequest : 사용자의 요청, 서블릿의 request와 동일
//    2) HttpServletResponse : 사용자에게 응답할 객체, 서블릿의 response와 동일
//    3) HttpSession : 스프링 전용, 사용자의 브라우저 연결 시점부터 종료시점까지 데이터를 서버에 보관할수 있는 영역 ★★★★★
//    4) java.util.Locale : 지역 설정(국가, 언어 코드)
//    5) OutputStream, InputStream : 파일(json, 바이너리 파일) 전달이나 받을 때 사용
//    6) Reader, Writer : 문자열을 받을 때 사용
//    7) Model : Jsp에 데이터를 넘길때 사용하는데, Request 보다 편리함 = Request 대용 ★★★★★
//    8) ModelAndView : 데이터 공유 및 View에 대한 정보도 저장하는 객체 ★★★★★
//    9) Map(컬랙션) ★★★★★
//     : 파라미터를 자동으로 컬랙션의 Map으로 맵핑시켜서 자동으로 받아옴
//    10) 커맨드 객체(Command Object) ★★★★★
//     : Class/객체 단위(DTO or POJO)로 파라미터를 지정하면 멤버 변수에 따라 자동으로 맵핑 시켜주는 기능
//       반드시 getter/setter가 카멜 표기법 네이밍 룰에 따라야함 (자동완성 하거나 lombok 사용 권장)
//    11) 일반 파라미터 ★★★★★
//     : @RequestParam을 통해 html-form의 name 값을 통해 java 변수로 변환하는 방법
//       내장된 type converter를 통해 사용자가 원하는 Type으로 자동 변환
//
//  3. 핸들러 메소드 파라미터 관련 어노테이션 정리
//   ■ 일반 Web 관련 어노테이션
//   - @RequestParam(value="parameter이름", 옵션.....) String id, : form에 있는 name과 메소드의 인자명 맵핑 시킬수 있음
//   		-> 옵션 : defaultValue = 만일 값이 없으면 기본값 셋팅, required = 필수값 셋팅, 없으면 처리X
//           파라미터를 정의할때 사용자가 정의한 Type으로 자동으로 변환해줌(내장 type converter 활용)
//   - @RequestHeader(value="헤더key값") (어노테이션)String ip, : Header의 정보를 가져오는 것
//   - @ModelAttribute("View에서 사용할 변수명") : View로 Model 값을 넘길때 사용하는 방법
//   - @CookieValue(value="쿠키key값") (어노테이션)String cookie : Client의 쿠키정보를 가져옴
//   - @SessionAttribute : Session값 가져올때 활용
//     		    -> 옵션 required = 필수값 셋팅 default=True, False로 바꿔서 활용한다.
//
//   ■ REST 전용 어노테이션 (향후 실습)
//   - @PathVariable("값") : restful방식으로 구현할때 URL에 있는 데이터를 가져올때 사용
//   - @ResponseBody : 클라이언트에게 응답할때 메소드 리턴값을 JSON 형태로 반환해주는 어노테이션(Jackson 기반 컨버팅)
//   - @RequesetBody : 클라이언트가 요청한 JSON 데이터를 Jackson으로 자동으로 컨버팅해주는 기능


import com.multi.mvc.member.model.dto.MemberDTO;
import com.multi.mvc.member.model.dto.MemberListDTO;
import com.multi.mvc.member.model.service.MemberService;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

// 서블릿을 대체하는 Controller
@Controller
public class MemberController {

    //    @Autowired // 기존 프로젝트는 대부분 Autowired를 통해 객체를 주입한다.
    @Setter(onMethod_ = {@Autowired}) // setter를 통해 Bean 주입하는 방법
    private MemberService service;

    // RequestMapping : 가장 기본적으로 요청처리가 가능한 어노테이션, get/post를 둘다 처리 가능
    @RequestMapping(value = {"/member/index.do","/member"}, method = RequestMethod.GET)
    public String index(/*이곳에 파라미터와 어노테이션으로 채울수 있는 공간*/) {
        return "member/index";
    }

    // http://localhost:8080/MVC_war/member/memberServlet.do

    //---------------------- 핸들러 메소드 스타일 정리 -------------------------
    // 1. 서블릿 스타일
    //  - 장점 : 서블릿을 쓰던 사람이나, 서블릿 프로젝트의 호환성을 유지시키기 위해 사용된다.
    //  - 단점 : 안쓴다.

    // get처리 : page만 응답하는 메소드
    @RequestMapping(value = "/member/memberServlet.do", method = RequestMethod.GET)
//    @GetMapping("/member/memberServlet.do")
    public String memberServletPage(){
        return "member/memberEnrollForServlet";
    }

    @RequestMapping(value = "/member/memberServlet.do", method = RequestMethod.POST)
    public String memberServlet(HttpServletRequest req, HttpServletResponse resp,
                                HttpSession session){
        MemberDTO member = new MemberDTO();
        member.setId(req.getParameter("id"));
        member.setName(req.getParameter("name"));
        member.setAge(Integer.parseInt(req.getParameter("age")));
        member.setGender(req.getParameter("gender"));
        member.setDevLang(
                new ArrayList<>(Arrays.asList(req.getParameterValues("devLang"))));

        // jsp forward로 넘기는 코드
        req.setAttribute("member", member);

        // 쿠키 사용법
        Cookie cookie = new Cookie("saveId", member.getId());
        cookie.setMaxAge(60 * 60); // 초단위
        resp.addCookie(cookie);

        // 세션 가져오는 방법 1 - 고전
        req.getSession().setAttribute("id", member.getId());

        // 세션 가져오는 방법2 - Spring에서 session을 주입해주는 방법 ★★★★★
        session.setAttribute("id", member.getId());

        return "member/memberView";
    }


    // 2. @RequestParam을 통해 View - Form의 파라미터를 받아오는 방법
    // - RequestParam을 통해 form에 있는 name과 핸들러 메소드의 파라미터를 맵핑시키는 방법
    // - 스프링에서 가장 올드한 스타일 -> 유명하고 아직도 사용되는 패턴
    // - model : view로 데이터를 보낼때 사용하는 객체, 파라미터를 담아서 forward로 넘겨 주기 가능
    // - @RequestParam(value="form의 name") : 파라미터를 받아오는 방법
    //          -> 만일 form name과 메소드의 파라미터 인자명이 일치하면 생략 가능, 만일 다르면 반드시 있어야한다.
    //    옵션 : defaultValue = 만일 값이 없으면 기본값 셋팅, required = 필수값 셋팅, 없으면 처리X
    // - 만일 배열의 파라미터인 경우, List<String>, String[] 둘다 처리가능

    @RequestMapping(value="/member/memberParams.do", method=RequestMethod.GET)
    public String memberParamsPage() {
        return "member/memberEnrollForParams";
    }

    // 고전 스타일
    @RequestMapping(value="/member/memberParams2.do", method=RequestMethod.POST)
    public String memberParams2(Model model,
                                @RequestParam(value = "id", defaultValue = "-", required = false) String memberId,
                                @RequestParam("name") String memberName,
                                @RequestParam("gender") String gender,
                                @RequestParam("age") int age,
//           @RequestParam(value = "devLang", required = false ) String[] devLang // 배열도 가능!
                                @RequestParam(value = "devLang", required = false) List<String> devLang // required=false 없으면 죽는다!
    ) {
        MemberDTO member = new MemberDTO();
        member.setId(memberId);
        member.setName(memberName);
        member.setAge(age);
        member.setGender(gender);
        member.setDevLang(devLang);

        // model을 통해 jsp(view)로 인자를 넘기는 방법
        // addAttribute : key-value값으로 인자를 넘기는 방법, request와 동일
        model.addAttribute("member", member);

        return "member/memberView";
    }

    // 만일, form의 name과 메소드의 파라미터 이름이 동일 한 경우 @RequestParam 생략 가능
    @RequestMapping(value="/member/memberParams.do", method=RequestMethod.POST)
    public String memberParams(Model model,
                               String id, String name,
                               String gender, int age,
                               List<String> devLang
    ) {
        MemberDTO member = new MemberDTO();
        member.setId(id);
        member.setName(name);
        member.setAge(age);
        member.setGender(gender);
        member.setDevLang(devLang);

        // model을 통해 jsp(view)로 인자를 넘기는 방법
        // addAttribute : key-value값으로 인자를 넘기는 방법, request와 동일
        model.addAttribute("member", member);

        return "member/memberView";
    }

    // 3. Command 객체(DTO, POJO)로 파라미터 처리하는 방법 ★★★★★
    // - 자바의 객체와 From의 name을 일치시켜 파라미터를 한번에 가져오는 방법
    // - 반드시 값간의 이름과 type 일치해야 자동으로 맵핑된다.
    // - ※ 주의 : 맵핑할 객체에 기본 자료형 + 배열, 이외 객체형은 처리 안됨, ex) Date
    // - 실제 현업에서 애용되는 스타일1
    // - 검색창이나 paging 처리를 위한 XXXForm 네이밍으로 설계 패턴 존재
    // - @RequestParam 있으면 처리 안됨!
    @RequestMapping(value="/member/memberCommand.do", method=RequestMethod.GET)
    public String memberCommandPage() {
        return "member/memberEnrollForCommand";
    }

    @RequestMapping(value = "/member/memberCommand2.do", method = RequestMethod.POST)
    public String memberCommand2(Model model, MemberDTO member) {
        model.addAttribute("member", member);
        System.out.println("\n@@@@@@@@@@@@@@@@ member : \n" + member.toString());
        return "member/memberView";
    }

    // Model 없이 View로 Forward로 넘기는 방법 (Model과 bind 하는 방식)
    // @ModelAttribute("name") : view에서 model 정보를 name으로 넘기는 방법
    @RequestMapping(value = "/member/memberCommand.do", method = RequestMethod.POST)
    public String memberCommand(@ModelAttribute("member") MemberDTO member) {
        return "member/memberView";
    }

    // 4. 컬렉션의 Map 활용법
    // - form 파라미터의 객체를 map으로 가져오는 방법
    // - 실제 현업에서 애용되는 스타일 no2 안에 든다.
    // - ※주의 : values(배열형)처리가 한번에 안된다! -> 하나만 들어온다.
    // - 장점 : DTO 상관 없이 모든 파라미터를 map으로 담아 편하게 처리할수 있다.
    // - 단점 : 맵으로 담기 때문에 키를 모두 문자열로 관리해야한다. 로직처리가 복잡하다.
    // - 현업에서는 map을 받아서 DB나 Mybatis로 넘겨 동적쿼리로만 인자를 활용하는 패턴 -> 추천X
    @RequestMapping(value="/member/memberMap.do", method=RequestMethod.GET)
    public String memberMapPage() {
        return "member/memberEnrollForMap";
    }

    // 배열 처리 안되는 예제
    @RequestMapping(value="/member/memberMap2.do", method=RequestMethod.POST)
    public String memberMap2(Model model, @RequestParam Map<String, Object> param) {
        System.out.println("\n@@@@@@@@@@@@map \n: "+ param);
        model.addAttribute("member", param);
        return "member/memberView";
    }

    // 배열 처리를 하는 예제
    @RequestMapping(value="/member/memberMap.do", method=RequestMethod.POST)
    String memberMap(Model model, @RequestParam Map<String, Object> param, String[] devLang) {
        param.put("devLang", devLang);
        System.out.println(param);
        model.addAttribute("member", param);
        return "member/memberView";
    }

    // 5. 배열 파라미터 처리하는 방법
    // - list[0].name, list[0].age, list[1].name, list[1].age ....
    // - 위와 같이 index 배열로 구성되어 있는 파라미터를 처리할때 활용
    // - 별도의 DTO를 만드는 것을 권장하는데, 참고 : memberListDTO
    @RequestMapping(value="/member/memberArrayParam.do", method=RequestMethod.GET)
    public String memberArrayParamPage() {
        return "member/memberEnrollForArrayParam";
    }

    @RequestMapping(value="/member/memberArrayParam.do", method=RequestMethod.POST)
    public String memberArrayParam(Model model, MemberListDTO memberListDTO) {
        System.out.println(memberListDTO);
        model.addAttribute("list", memberListDTO.getList());
        return "member/memberList";
    }

    // 6. PathVariable
    // - path(URL) 상의 입력값을 파라미터로 가져오는 방법
    // - 주로 REST 요청시의 path 기반 입력값을 가져올때 활용한다.
    // - ex) /member/rest/testid123 'testid123' 가지고 올 때
    @GetMapping("/member/{type}/{id}")
    public String memberRestPage(Model model, @PathVariable String type, @PathVariable("id") String memberId) {
        model.addAttribute("msg", type + ", " + memberId);
        model.addAttribute("location", "/member/index.do");
        return "common/msg";
    }

    // 7. header, cookie, Session 정보 받아 오기
    // Writer : JSON이나 문자열 형태로 만들때는 Writer를 활용된다. -> resp 있었던 객체.
    // @RequestHeader : header값 가져오는 어노테이션
    // @CookieValue : 쿠기 정보를 가져올때 사용하는 어노테이션, required = false 일때 null 허용된다.
    // @SessionAttribute : 세션 정보를 가져올때 사용하는 어노테이션, required = false 일때 null 허용된다.
    // void 인경우는 return 없을때 활용 -> view가 존재하지 않는다!
    // 참고로 REST는 더 좋게 만드는 방법이 있음으로 Writer 쓰지 말것.

    @RequestMapping("/member/memberAddInfo.do") // GET + POST 둘다 처리
    public void memberAddInfo(Writer writer,
        @RequestHeader(value = "user-agent") String userAgent,
        @RequestHeader(value = "referer") String prevPage,
        @CookieValue(value = "saveId", required = false) String saveId,
        @CookieValue(value = "id", required = false) String sessionId
    ) throws IOException {
        writer.append("<html>");
        writer.append("userAgent : " + userAgent + "<br>");
        writer.append("prevPage : " + prevPage + "<br>");
        writer.append("cookie - saveId : " + saveId + "<br>");
        writer.append("sessionId : " + sessionId + "<br>");
        writer.append("</html>");
    }

    // 8. Service 객체 활용, ModelAndView 스타일, 에러 처리하는 방법
    // ModelAndView 패턴
    // - Spring에서 올드한 패턴중 하나로 필드에서 가장 빈번되는 활용되는 스타일 (=전자정부 프레임워크)
    // - addObject : view로 보낼 파라미터를 처리하는 방법 model의 일
    // - setViewName : return 하였던 view의 이름을 설정하는 메소드
    // http://localhost/basic/member/memberEnroll.do
    @RequestMapping(value = "/member/memberEnroll.do", method = RequestMethod.GET)
    public ModelAndView memberEnrollPage(ModelAndView model) {
        model.setViewName("member/memberEnroll");
        return model;
    }

    @RequestMapping(value = "/member/memberEnroll.do", method = RequestMethod.POST)
    public ModelAndView memberEnroll(ModelAndView model, MemberDTO member) {
        int result = service.memberEnroll(member);
        if(result>0){ // 성공
            model.addObject("msg", "회원가입에 성공했습니다.");
            model.addObject("location", "/member/index.do");
            model.setViewName("common/msg");
        }else{
            model.setViewName("redirect:error.do"); // 에러페이지로 리다이레트 /member/

        }
        return model;
    }

    // 9. List를 통해 회원정보 리스트 보기
    @RequestMapping("/member/memberList.do")
    public String memberList(Model model){
        List<MemberDTO> list = service.getAllList();
        model.addAttribute("list", list);
        if(list != null){
            return "member/memberList";
        }else{
            return "error.do";
        }
    }

    // 10. 에러페이지 처리
    @RequestMapping("/member/error.do")
    public String errorPage(String msg){
        System.out.println("에러 발생 로그 출력!");
        return "common/error";
    }
}
