package com.zero.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.zero.project.model.ProductVO;
import com.zero.project.service.MainService;

import lombok.Setter;

@RestController
@RequestMapping("/list")
public class MainJsonController {
	
	@Setter(onMethod_= @Autowired)
	private MainService service;
	
	/* 이 메뉴는 어떠세요? */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/recommend",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
								MediaType.APPLICATION_XML_VALUE
								})
	public String recommend() {
		
		/* System.out.println("success"); */
		
		List<ProductVO> list = service.recommend();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		/* System.out.println("success2"); */
		
		System.out.println(json);
		
		return json;
	}
}
