package com.example.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  // view를 내릴 때는 @ResponseBody가 없다.
public class Lesson01Ex02Controller {
	//요청 URL: http://localhost:8080/lesson01/ex02/1
	
	@RequestMapping("/lesson01/ex02/1")
	public String ex02_1() {
		//ResponseBody 가 아닌 상태로 String을 리턴하면
		// ViewResolver에 의해서 리턴된 String 이름의 view를 찾고 jsp파일과 매핑되어 view 화면이 구성된다.
		// /WEB-INF/jsp/lesson01/ex02.jsp 가 원래 경로인데, 
		// < src/main/resources의 application.properties파일에 prefix와 suffix가 이미 lesson01/ex02 양 끝의 부가적 경로를 채워주고 있다.
		// 그래서 lesson01/ex02만 쓰면 된다.
		return "lesson01/ex02"; //jsp view경로와 이름
	}
}
