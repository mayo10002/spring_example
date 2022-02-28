package com.example.Lesson05;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson05Controller {

		@RequestMapping("/lesson05/ex01")
		public String ex01() {
			return "lesson05/ex01";
		}
		
		@RequestMapping("/lesson05/ex02")
		public String ex02(Model model) {
			//String list
			List<String> fruits=new ArrayList<>();
			fruits.add("사과");
			fruits.add("멜론");
			fruits.add("포도");
			fruits.add("딸기");
			fruits.add("망고");
			
			model.addAttribute("fruits",fruits);
			
			
			//List<Map>
			List<Map<String, Object>> users = new ArrayList<>();
			
			Map<String, Object> userMap = new HashMap<>();
			userMap.put("name", "구태현");
			userMap.put("age", 25);
			userMap.put("hobby", "독서");
			users.add(userMap);
			
			userMap = new HashMap<>();
			userMap.put("name", "신바다");
			userMap.put("age", 4);
			userMap.put("hobby", "그루밍");
			users.add(userMap);
			
			model.addAttribute("users", users);
			
			return "lesson05/ex02";
		}
}
