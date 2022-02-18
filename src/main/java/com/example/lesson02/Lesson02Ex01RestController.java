package com.example.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.lesson02.bo.UsedGoodsBO;
import com.example.lesson02.model.UsedGoods;

@RestController // @controller + @ResponseBody
public class Lesson02Ex01RestController {
	@Autowired //DI (Dependency Injection) 의존성 주입: new 가져올 필요 없음. 이 annotation이 대신 해준다
	private UsedGoodsBO usedGoodsBO;
	
	//요청 URL : http://localhost:8080/lesson02/ex01
	@RequestMapping("/lesson02/ex01")
	public List<UsedGoods> ex01() {
		return usedGoodsBO.getUsedGoodsList();
	}
}
