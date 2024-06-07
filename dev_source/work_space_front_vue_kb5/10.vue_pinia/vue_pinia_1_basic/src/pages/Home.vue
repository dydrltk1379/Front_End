<template>
  <div class="container">
    <br>
    <h2>Http의 stateless(무상태성)에 대한 이해</h2>
    <!-- stateless : 스레드로 물고 있는 상태에서 끊어지면 없어지는 형태-->
    <div>- Http는 stateless 설계가 되어 있어 요청때마다 항상 새로운 상태가 됨 </div>
    <div>  -> 114에 전화할때마다 받는 사람이 달라 기존 문의 내용을 기억 못함  </div>
    <div>- 무상태성에서 상태(state)를 저장하기 위한 방법은 Session, Cookie, WebStorage가 존재</div>
    <div>- State를 유지하는 주요 정보는 인증 정보(로그인)이며, 해당 정보를 기반으로 Page 접근을 제한함</div>
    <div>- 이밖에 부가적으로 State를 활용하능 원인은 성능(트래픽, 네트워크, ★DB) 이슈임</div>
    <!-- sns, 커뮤니티 등 트래픽이 발생하면 db에 무리가기 때문에 컴퓨터 로컬 저장-->
    <div>- 트래픽이 많은 사이트에서는 state 공간(local)을 cache로 활용하여 성능 개선이 가능 </div>
    <div>- https://velog.io/@duarufp06/HTTP-Stateless-Connectionless-HTTP-%EB%A9%94%EC%8B%9C%EC%A7%80-%EA%B0%9C%EB%85%90</div>
    <hr><br>

    <h2>Pinia란?</h2>
    <div>- 스토어(started) 라이브러리로, 구성 요소/페이지 전체에서 상태(state)를 공유/관리 가능함</div>
    <div>- Pinia(=Redux : 리액트)류가 개발된 이유는 원래는 디버깅 용도였고, SPA 계열에서 새로운 아키텍처를 제시함</div>
    <div>- 기존 SPA에서 서버 데이터 요청 방법은 페이지 컴포넌트 로드시 axios를 통한 요청이 일반적(전통적 방법)</div>
    <div>- 하지만 SPA에서 페이지 개념이 없어 axios로 받아온 데이터를 충분히 재사용할수 있음</div>
    <div>- 이럴때 개발자 역량에 따라 각자 store할수 있는 다양한 방법으로 구현됨(web-storage, singleton 저장소, 전역변수...)</div>
    <div>- Pinia를 활용하면 표준적인 아키텍처를 통해 일관성있게 상태성 데이터를 관리 가능!</div>
    <div>- ※ 주의사항 : Real-time을 요구하는 정보는 최신 정보로 업데이트 될수 있는 로직 필요!</div>
    <!-- db에 게속 가져오지말고 -->
    <div>- https://pinia.vuejs.org/</div>
    <br>

    <h2>Pinia 활용 예시</h2>
    <div> 1. 인증정보 저장 이후 모든 컴포넌트에서 인증 정보 재사용(JWT 토근 공유)</div>
    <div> 2. 부모(list)-자식(detail) 페이지 구조 설계시 id만을 통해 데이터 공유 가능 </div>
    <!-- props로 다 받아오지 말고 id만 받아 올 것 -->
    <div> 3. step을 가지는 페이지 구성(다중 회원가입, 다중 결제페이지)시 step 별 상태값 관리 </div>
    <div> 4. 트리구조 컴포넌트 구성(장바구니)시 props 최소 사용 및 자식 컴포넌트 입력 값 공유</div>
    <div> 5. 이밖에 복잡한 UI에서 상태값을 공유할때 기존 props나 provide, emit 설계 대신 활용 가능!</div>
    <br><br><br><br><br><br><br>
  </div>
</template>

<script setup>
</script>