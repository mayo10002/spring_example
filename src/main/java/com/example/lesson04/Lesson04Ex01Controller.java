package com.example.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.lesson04.bo.UserBO;
import com.example.lesson04.model.User;

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
		
		userBO.addNewUserAsField(name, yyyymmdd, email, introduce);
		
		// 결과 jsp
		return "lesson04/after_add_user"; //결과 jsp 경로
		
	}
	
	// 가장 최근에 추가된 사람 한 명 가져오기
	// 요청 URL : http://localhost:8080/lesson04/ex01/2

	@GetMapping("/ex01/2")
	public String getUserView(Model model) { // view 화면에 데이터를 넘겨주는 객체(ModelAndView는 요즘 잘 사용하지 않는다.)
		// DB select - 가장 최근에 추가된 사람 한명 가져오기
		User user = userBO.getLastUser();
		model.addAttribute("result", user); // 결과 jsp View에 결과 객체값을 넘겨준다.
		model.addAttribute("subject", "회원 정보");		

		return "lesson04/get_last_user"; // 결과 jsp
	}
	
}
