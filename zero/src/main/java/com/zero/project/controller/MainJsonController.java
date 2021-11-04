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

	/* 새로 나온 메뉴 */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/news",
	produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE
	})
	public String news() {
		
		/* System.out.println("success"); */
		
		List<ProductVO> list = service.news();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		/* System.out.println("success2"); */
		
		System.out.println("신상품" + json);
		
		return json;
	}

	/* 간편 요리 */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/simple",
	produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE
	})
	public String simple() {
		
		/* System.out.println("success"); */
		
		List<ProductVO> list = service.simple();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		/* System.out.println("success2"); */
		
		System.out.println(json);
		
		return json;
	}

	/* 특별한 반찬 */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/special",
	produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE
	})
	public String special() {
		
		/* System.out.println("success"); */
		
		List<ProductVO> list = service.special();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		/* System.out.println("success2"); */
		
		System.out.println(json);
		
		return json;
	}
	
	/* 주류, 음료 */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/beverage",
	produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE
	})
	public String beverage() {
		
		/* System.out.println("success"); */
		
		List<ProductVO> list = service.beverage();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		/* System.out.println("success2"); */
		
		System.out.println(json);
		
		return json;
	}

	/* 간식과 간편식 */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/desert",
	produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE
	})
	public String desert() {
		
		/* System.out.println("success"); */
		
		List<ProductVO> list = service.desert();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		/* System.out.println("success2"); */
		
		System.out.println(json);
		
		return json;
	}
	
	//인기 상품 리스트 출력
	@GetMapping("/popularity")
	public String popularity() {
		
		List<ProductVO> list = service.getList_pop();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		System.out.println("인기 상품 리스트" + json);
		
		return json;
		
	}
	//신상품 리스트 출력
	@GetMapping("/new")
	public String newPage() {
		
		List<ProductVO> list = service.getList_new();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		System.out.println("인기 상품 리스트" + json);
		
		return json;
		
	}
	//선물 상품 리스트 출력
	@GetMapping("/pres")
	public String pres() {
		
		List<ProductVO> list = service.getList_pres();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		System.out.println("인기 상품 리스트" + json);
		
		return json;
		
	}
	//인기 상품 리스트 출력
	@GetMapping("/categoryList")
	public String categoryList() {
		
		List<ProductVO> list = service.getList_pop();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		
		System.out.println("인기 상품 리스트" + json);
		
		return json;
		
	}
	
}
