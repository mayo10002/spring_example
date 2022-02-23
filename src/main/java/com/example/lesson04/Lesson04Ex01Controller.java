package com.example.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.lesson04.bo.UserBO;

@Controller
//jsp 같은 view화면이 응답값일 때는 그냥 Controller
public class Lesson04Ex01Controller {
	
	// 회원가입 화면
	// 요청: http://localhost:8080/lesson04/ex01/1
	@RequestMapping(path="/lesson04/ex01/1",method=RequestMethod.GET)
	public String ex01() {
		//		/WEB-INF/jsp/		.jsp     <= application.properties에서 설정해줘서 원래 주소에서 생략 가능한 부분
		//		//WEB-INF/jsp/lesson04/add_user.jsp <=원래 써야 하는 주소
		return "lesson04/add_user"; //view 경로
		
	}
	@Autowired
		private UserBO userBO;	
	
	// 405 에러 : request method 불일치
	// 요청: http://localhost:8080/lesson04/ex01/add_user
	@PostMapping("/lesson04/ex01/add_user")
	public String addUser(
			@RequestParam("name")String name,
			@RequestParam("yyyymmdd")String yyyymmdd,
			@RequestParam("email")String email,
			@RequestParam(value="introduce",required=false)String introduce
			) {
		// insert DB 
		
		userBO.addNewUserAsField(11, "콤비네이션R" , "신바다" , 5.0 , "역시 맛있다!!!");
		
		// 결과 jsp
		return "lesson04/after_add_user"; //결과 jsp 경로
		
	}
	
	
}
