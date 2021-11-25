package com.zero.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.zero.project.model.ProductVO;
import com.zero.project.service.AdminProductService;
import com.zero.project.service.MainService;

import lombok.Setter;

@RestController
@RequestMapping("/list")
public class MainJsonController {

	@Setter(onMethod_ = @Autowired)
	private MainService service;
	
	@Setter(onMethod_= @Autowired)
	private AdminProductService productService;

	
	/* 이 메뉴는 어떠세요? */
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/recommend", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String recommend() {

		/* System.out.println("success"); */

		List<ProductVO> list = service.recommend();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("success2"); */

		/* System.out.println(json); */

		return json;
	}

	/* 새로 나온 메뉴 */
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/news", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE })
	public String news() {

		/* System.out.println("success"); */

		List<ProductVO> list = service.news();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("success2"); */

		/* System.out.println("신상품" + json); */

		return json;
	}

	/* 간편 요리 */
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/simple", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String simple() {

		/* System.out.println("success"); */

		List<ProductVO> list = service.simple();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("success2"); */

		/* System.out.println(json); */

		return json;
	}

	/* 특별한 반찬 */
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/special", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String special() {

		/* System.out.println("success"); */

		List<ProductVO> list = service.special();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("success2"); */
		/*
		 * System.out.println(json);
		 */

		return json;
	}

	/* 주류, 음료 */
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/beverage", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String beverage() {

		/* System.out.println("success"); */

		List<ProductVO> list = service.beverage();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("success2"); */

		/* System.out.println(json); */

		return json;
	}

	/* 간식과 간편식 */
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/desert", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String desert() {

		/* System.out.println("success"); */

		List<ProductVO> list = service.desert();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("success2"); */

		/* System.out.println(json); */

		return json;
	}

	// 인기 상품 리스트 출력
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/popularity", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE })
	public String popularity() {

		List<ProductVO> list = service.getList_pop();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("인기 상품 리스트" + json); */

		return json;

	}

	// 신상품 리스트 출력
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/new", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String newPage() {

		List<ProductVO> list = service.getList_new();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/*
		 * System.out.println("인기 상품 리스트" + json);
		 */
		return json;

	}

	// 선물 상품 리스트 출력
	@GetMapping(value = "/pres", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String pres() {

		List<ProductVO> list = service.getList_pres();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("인기 상품 리스트" + json); */

		return json;

	}

	// 카테고리 리스트 출력
	@GetMapping(value = "/categoryList", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String categoryList() {

		List<ProductVO> list = service.getList_pres();

		Gson gson = new Gson();

		String json = gson.toJson(list);

		/* System.out.println("인기 상품 리스트" + json); */

		return json;

	}
	
	@GetMapping(value="/today", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public String today() {
		
		List<ProductVO> list = service.today();
		
		List<ProductVO> trans_data = new ArrayList<>();
		
		Gson gson = new Gson();
		
		
		if(list != null && !list.isEmpty()) {
			for(int i=0; i<list.size(); i++) {
				
				
				if(list.get(i) != null) {
					
					int product_no = list.get(i).getProduct_no();
					
					ProductVO vo = productService.getProduct(product_no);
										
					trans_data.add(vo);
					
				} 

			}
			
			String json = gson.toJson(trans_data);
			
			return json;
			
		} else {
			
			String str = "오늘의 베스트 상품 데이터가 없습니다. 선우에게 문의하세요.";
			
			String data = gson.toJson(str);
			
			return data;
		}
		
	}
	
	@GetMapping(value="/week", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public String week() {
		
		List<ProductVO> list = service.week();
		
		List<ProductVO> trans_data = new ArrayList<>();
		
		Gson gson = new Gson();
		
		
		if(list != null && !list.isEmpty()) {
			for(int i=0; i<9; i++) {
				
				if(list.get(i) != null) {
					
					int product_no = list.get(i).getProduct_no();
					
					ProductVO vo = productService.getProduct(product_no);
					
					trans_data.add(vo);
					
				}
			}
			
			String json = gson.toJson(trans_data);
			
			return json;
			
		} else {
			
			String str = "이번주 베스트 상품 데이터가 없습니다. 선우에게 문의하세요.";
			
			String data = gson.toJson(str);
			
			return data;
		}
	}
	
	@GetMapping(value="/month", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public String month() {
		
		List<ProductVO> list = service.month();
		
		List<ProductVO> trans_data = new ArrayList<>();
		
		Gson gson = new Gson();
		
		
		if(list != null && !list.isEmpty()) {
			for(int i=0; i<9; i++) {
				
				if(list.get(i) != null) {
					
					int product_no = list.get(i).getProduct_no();
					
					ProductVO vo = productService.getProduct(product_no);
					
					trans_data.add(vo);
					
				}
			}
			
			String json = gson.toJson(trans_data);
			
			return json;
			
		} else {
			
			String str = "이번달 베스트 상품 데이터가 없습니다. 선우에게 문의하세요.";
			
			String data = gson.toJson(str);
			
			return data;
		}

	}
}
