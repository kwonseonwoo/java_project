package com.zero.project.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.project.model.CartVO;
import com.zero.project.model.Criteria;
import com.zero.project.model.MemberVO;
import com.zero.project.model.ProductVO;
import com.zero.project.model.ReplyVO;
import com.zero.project.service.AdminMemberService;
import com.zero.project.service.AdminProductService;
import com.zero.project.service.CartService;
import com.zero.project.service.MainService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
public class MainController {

	@Setter(onMethod_ = @Autowired)
	private AdminProductService service;
	
	@Setter(onMethod_= @Autowired)
	private AdminMemberService service2;
	
	@Setter(onMethod_= @Autowired)
	private MainService service3;
	
	@Setter(onMethod_= @Autowired)
	private CartService service4;
	
	
	// 메인 페이지
	@GetMapping("/main")
	public String main(Principal principal, HttpSession session) {
		
		if(principal != null) {
		MemberVO member = service2.getMember2(principal.getName());
		CartVO vo = service4.count(member.getMember_no());
		
		System.out.println("카트 개수 출력: " + vo.getCounts());
		
		int no = 0;
		if(vo.getCounts()==0) {
			session.setAttribute("counts", no);
		}else {
			session.setAttribute("counts", vo.getCounts());
		}
		return "/main";
	  } else {
		  System.out.println("로그인 안된 상태로 메인 이동");
		  return "/main";
	  }
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
		  
		  String piece = null;
		  
		  if(vo.getProduct_replyCnt() != 0) {
			  
		  ReplyVO replies = service3.avg(product_no);
		  System.out.println(replies.getAverage());
		  
		  String str = replies.getAverage();
		  
		  
		  if(str.length() >= 4) {
			  piece = str.substring(0,3);
		  }else {
			  piece = str;
		  }
		  
		  }
		  System.out.println("average: " + piece);
		  
		  model.addAttribute("average", piece);

		 
	}
	
	@RequestMapping("/searchForm/search")
	public void searchForm(Criteria cri, Model model) {
		
		model.addAttribute("list", service3.getListWithPaging(cri));
		
		System.out.println("검색 리스트 출력: " + service3.getListWithPaging(cri));
		
		/* model.addAttribute("pageMaker", cri); */
		
	}

	

}
