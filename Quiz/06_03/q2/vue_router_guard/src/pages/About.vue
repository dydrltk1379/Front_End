<template>
    <div class="card card-body">
      <h2>About {{ user.name }}</h2>
      <p>Tel : {{ user.tel }}</p>
      <p>Address : {{ user.address }}</p>
    </div>
  </template>
  
  <script setup>
  // 비동기 처리 코드
  // -> 만일 Suspense 처리가 되지 않은 경우에 setup에서 수행하는 경우 페이지 로드가 늦게 뜸!
  import { reactive } from "vue";
  const user = reactive({ no: 0, name: "", tel: "", address: "" });
  const url = "https://contactsvc.bmaster.kro.kr/contacts_long?pageno=1";
  const response = await fetch(url);
  const contactList = await response.json();
  user.no = contactList.contacts[1].no;
  user.name = contactList.contacts[1].name;
  user.tel = contactList.contacts[1].tel;
  user.address = contactList.contacts[1].address;
  
  // 예비코드
//   const user = reactive({ no: 0, name: "", tel: "", address: "" });
//   const url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";
//   const response = await fetch(url);
//   const jsonObj = await response.json()
//   const movieObj = jsonObj.boxOfficeResult.dailyBoxOfficeList[0];
//   user.no = movieObj.rank;
//   user.name = movieObj.movieNm;
//   user.tel = movieObj.openDt;
//   user.address = movieObj.salesAmt;
  </script>
  