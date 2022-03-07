package com.example.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.lesson04.bo.UserBO;

@RequestMapping("/lesson06/ex01")
@Controller
public class Lesson06Controller {
	@Autowired
	private UserBO userBO;
	//유저 추가 화면
	//요청 URL 화면: http://localhost:8080/lesson06/ex01/add_user_view
	@RequestMapping("/add_user_view")
	public String addUserView() {
		return "lesson06/add_new_user";
	}
	
	// 유저 추가
	// 요청 URL 화면: http://localhost:8080/lesson06/ex01/add_user
	// AJAX가 요청하는 경우 ResponseBody가 있어야 한다.(법칙임)
	// AJAX가 요청하는 응답값은 String 이다. 
	@ResponseBody
	@PostMapping("/add_user")
	public String addUser(
			@RequestParam("name")String name,
			@RequestParam("yyyymmdd") String yyyymmdd,
			@RequestParam("email")String email,
			@RequestParam(value="introduce", required=false)String introduce) {
		
		// TODO insert DB
		userBO.addNewUserAsField(name, yyyymmdd, email, introduce);
		
		
		return "성공"; //alert(data) 로 넘어가야 함
	}
	
	@RequestMapping("/get_user_view")
	public String getUserView() {
		return "lesson06/get_user";
	}
}
