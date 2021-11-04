package com.zero.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.project.mapper.MainMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;



@Controller
@AllArgsConstructor
public class MainController {

	@Setter(onMethod_= @Autowired)
	private MainMapper mapper;
	
	//메인 페이지 
	@GetMapping("/main")
	public void main() {

	}
	
	//인기 상품 리스트 출력
	@RequestMapping("/productList/popularity")
	public void popularity() {
		
	}

	//신상품 리스트 출력
	@RequestMapping("/productList/new")
	public void newPage() {
		
	}
	
	//선물 상품 리스트 출력
	@RequestMapping("/productList/pres")
	public void pres() {
		
	}
	
	/* 간편 요리 *//* 특별한 반찬 *//* 주류/음료 *//* 간식/간편식 */
	@RequestMapping("/productList/categoryList")
	public void categoryList(String product_type, Model model) {
		
		model.addAttribute("type_name", product_type);
		
		System.out.println(product_type);
		
	}
	

	
	
}
