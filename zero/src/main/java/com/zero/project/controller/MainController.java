package com.zero.project.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.project.mapper.MainMapper;
import com.zero.project.model.Criteria;
import com.zero.project.model.PageDTO;
import com.zero.project.model.ProductVO;
import com.zero.project.service.AdminProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
public class MainController {

	@Setter(onMethod_ = @Autowired)
	private AdminProductService service;

	@Setter(onMethod_ = @Autowired)
	private MainMapper mapper;

	// 메인 페이지
	@GetMapping("/main")
	public void main() {

	}

	// 인기 상품 리스트 출력
	@RequestMapping("/productList/popularity")
	public void popularity() {

	}

	// 신상품 리스트 출력
	@RequestMapping("/productList/new")
	public void newPage() {

	}

	// 선물 상품 리스트 출력
	@RequestMapping("/productList/pres")
	public void pres() {

	}

	/* 간편 요리 *//* 특별한 반찬 *//* 주류/음료 *//* 간식/간편식 */
	@RequestMapping("/productList/categoryList")
	public void categoryList(String product_type, Model model) {

		model.addAttribute("type_name", product_type);

		System.out.println(product_type);

	}

	/* 상품 상세view Page */
	@RequestMapping("/productView/productView")
	public void productView(int product_no, Model model) {

		ProductVO vo = service.getProduct(product_no);

		model.addAttribute("product", vo);

		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, +3);

		String del_time = new SimpleDateFormat("yyyy-MM-dd E").format(day.getTime());
		
		/* System.out.println(del_time); */
		
		
		  String[] content = del_time.split("-"); 
		  String[] content2 = content[2].split(" ");
		  
			/* System.out.println(content[0]); */ 
		  System.out.println(content[1]); //월
			/* System.out.println(content[2]); */
		  System.out.println(content2[0]); //일
		  System.out.println(content2[1]); //요일
		  
		  
		  model.addAttribute("month", content[1]); 
		  model.addAttribute("day", content2[0]); 
		  model.addAttribute("days", content2[1]);
		 

	}
	
	@RequestMapping("/searchForm/search")
	public void searchForm(Criteria cri, Model model) {
		
		model.addAttribute("list", service.getListWithPaging(cri));
		
		System.out.println("검색 리스트 출력: " + service.getListWithPaging(cri));
		
		/* model.addAttribute("pageMaker", cri); */
		
	}

}
