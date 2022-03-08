package com.example.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.lesson04.bo.UserBO;

@Controller
public class Lesson06Ex02Controller {
	@Autowired
	private UserBO userBO;
		@RequestMapping("/lesson06/ex02/add_user_view")
		public String addUserView() {
			
			return "lesson06/add_user";
		}
		
		//중복 확인
		@ResponseBody //ajax 어노테이션이 붙어있으면 꼭!
		@RequestMapping("/lesson06/ex02/is_duplication")
		public Map<String, Boolean> isDuplication(
			@RequestParam("name") String name){
				
			//TODO db 조회
			Map<String, Boolean> result = new HashMap<>();
			
			result.put("is_duplication", userBO.existUserByName(name));
			return result;
		}
}
