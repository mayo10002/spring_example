package com.example.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class etestController {
	@ResponseBody
	@RequestMapping("/test1")
	public String test1() {
		return "helloworld";
	}
}
//boot