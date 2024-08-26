package com.multi.rest.content.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.multi.rest.content.model.vo.Cat;

// Pure REST 페이지를 파싱 없이 객체로 변환 가능 한 스킬
public class RestTemplateTest {
	public static void main(String[] args) {
		RestTemplate rest = new RestTemplate();
		String url = "http://localhost/cat";
		
		System.out.println("1. list 요청하기");
		Cat[] catArray = rest.getForObject(url, Cat[].class);
		if(catArray != null) {
			for(int i = 0 ; i< catArray.length; i++) {
				System.out.println(catArray[i].toString());
			}
		}
		System.out.println("--------------------------------------------------------");
		
		
		System.out.println("2. 이름으로 list 요청하기");
		String name = "페르시안";
		catArray = rest.getForObject(url + "?name="+name, Cat[].class);
		if(catArray != null) {
			for(int i = 0 ; i< catArray.length; i++) {
				System.out.println(catArray[i].toString());
			}
		}
		System.out.println("--------------------------------------------------------");
		
		System.out.println("3. id로 요청하는 방법");
		Map<String, String> map = new HashMap<String, String>();
		map.put("animal", "cat");
		map.put("id", "3");
		
		Cat cat = rest.getForObject(url+"/{id}", Cat.class, map);
		if(cat != null) {
			System.out.println(cat);
		}
		System.out.println("--------------------------------------------------------");
		
		System.out.println("4. insert 하기");
		cat.setName("호랑이");
		ResponseEntity<Cat> result = rest.postForEntity(url, cat, Cat.class);
		HttpStatus status = result.getStatusCode();
		Cat cat2 = result.getBody();
		System.out.println("status : " + status.value());
		System.out.println("cat2 : " + cat2);
		System.out.println("--------------------------------------------------------");
		
		System.out.println("5. update 하기");
		cat2.setName("모르는 고양이222");
		rest.put(url + "/{id}", cat2, cat2.getId()); // update
		Cat updateCat = rest.getForObject(url + "/{id}", Cat.class, cat2.getId());
		System.out.println(updateCat);
		System.out.println("-------------------------------------------\n");
		
		
		System.out.println("6. delete 하기");
		rest.delete(url+"/{id}", cat2.getId());
		System.out.println("삭제 성공!");
		ResponseEntity<Cat> result2 = rest.getForEntity(url + "/{id}", Cat.class, cat2.getId());
		HttpStatus status2 = result2.getStatusCode();
		System.out.println(status2.value());
		System.out.println("-------------------------------------------\n");
	}
}













