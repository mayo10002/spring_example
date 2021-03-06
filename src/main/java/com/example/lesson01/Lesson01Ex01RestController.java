package com.example.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/ex01")
@RestController  // @Controller 와 ResponseBody 가 합쳐져 있다. 
public class Lesson01Ex01RestController {
 // 요청 URL  : http://localhost:8080/lesson01/ex01/3
	@RequestMapping("/3")
	public String ex01_3() {
		return "RestController 를 사용해서 String을 리턴해본다.";
	}
	 // 요청 URL  : http://localhost:8080/lesson01/ex01/4
	
	@RequestMapping("/4")
	public Map<String, String> ex01_4(){
		
		Map<String, String> map = new HashMap<>();
		map.put("aaa", "111");
		map.put("bbb", "222");
		map.put("ccc", "333");
		return map; // jackson라이브러리를 통해 json으로 변환되어 내려간다.
		
	}
	
	 // 요청 URL  : http://localhost:8080/lesson01/ex01/5
	@RequestMapping("/5")
	public Data ex01_5() {
		Data data = new Data();//일반 자바 bean
		data.setId(1);
		data.setName ("구태현");
		
		return data; // 일반 bean객체도 json으로 내려간다.
	}
	
	 // 요청 URL  : http://localhost:8080/lesson01/ex01/6

	@RequestMapping("/6")
	public ResponseEntity<Data> ex01_6() {
		Data data = new Data(); // 일반 자바 bean
		data.setId(23);
		data.setName("신바다");
		
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
