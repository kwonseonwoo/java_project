package com.zero.project.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zero.project.model.CartVO;
import com.zero.project.model.Criteria;
import com.zero.project.model.Criterias;
import com.zero.project.model.MemberVO;
import com.zero.project.model.OrderDTO;
import com.zero.project.model.OrderDetailVO;
import com.zero.project.model.OrderVO;
import com.zero.project.model.PageDTO;
import com.zero.project.model.PageDTOS;
import com.zero.project.model.ProductVO;
import com.zero.project.service.AdminMemberService;
import com.zero.project.service.AdminProductService;
import com.zero.project.service.CartService;
import com.zero.project.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
public class OrderController {

	@Setter(onMethod_= @Autowired)
	private CartService service;
	
	@Setter(onMethod_= @Autowired)
	private AdminMemberService memberService;
	
	@Setter(onMethod_= @Autowired)
	private AdminProductService productService;
	
	@Setter(onMethod_= @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_= @Autowired)
	private CartService cartService;
	
	
	/* 카트에서 결제 */
	@RequestMapping("/buy/buy")
	public String buy(int[] cart_no, Model model, Principal principal) {
		
		List<CartVO> list = new ArrayList<>();
		
		if(principal != null) {
			for(int i=0; i<cart_no.length; i++) {
				
				if(cart_no[i] == 0) {
					/* cart_no != 0 일 경우 조회 수행*/
					continue;
				}else {
					/* cart_no == 0 일 경우 조회하지 않고 continue */
					CartVO vo = service.getPurchase(cart_no[i]);
					
					list.add(vo);
				}
				
			}
			
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(list);
			model.addAttribute("list", json);
			
			MemberVO member = memberService.getMember2(principal.getName());
			
			String str = member.getMember_phone();
			String[] phone = str.split("-");
			
			model.addAttribute("member", member);
			model.addAttribute("phone1", phone[0]);
			model.addAttribute("phone2", phone[1]);
			model.addAttribute("phone3", phone[2]);
			
			return "/buy/buy";
		} else {
			return "redirect:/auth/loginForm";
		}
		
		
	}
	
	/* 바로 결제 */
	@RequestMapping("/buy/directBuy")
	public String Db(int product_no, int quantity, Model model, Principal principal) {
		
		/* System.out.println("상품번호:" + product_no); */
		/* System.out.println("상품 수량:" + quantity); */
		
		if(principal != null) {
			MemberVO member = memberService.getMember2(principal.getName());
			
			String str = member.getMember_phone();
			String[] phone = str.split("-");
			
			model.addAttribute("member", member);
			model.addAttribute("phone1", phone[0]);
			model.addAttribute("phone2", phone[1]);
			model.addAttribute("phone3", phone[2]);
			
			ProductVO vo = productService.getProduct(product_no);
			
			Gson gson = new GsonBuilder().create();
			
			String json = gson.toJson(vo);
			String json2 = gson.toJson(quantity);
			
			model.addAttribute("product",json);
			model.addAttribute("quan",json2);
			
			return "/buy/directBuy";
		}else {
			return "redirect:/auth/loginForm";
		}
		
	}
	
	/* 바로 결제 오더 */
	@RequestMapping("/buy/direct")
	public String buy_dr(OrderVO vo, RedirectAttributes rttr) {
		
		/*
		 * System.out.println("오더 멤버 번호: " + vo.getMember_no());
		 * System.out.println("오더 상품 번호: " + vo.getProduct_no());
		 */
		/* System.out.println("오더vo 수량정보: " + vo.getProduct_quantity()); */
		
		//오더 테이블 등록
		orderService.register(vo);
		
		//방금 등록된 오더 테이블의 오더 넘버 받아오기
		OrderVO order = orderService.read(vo.getMember_no());
		
		OrderDetailVO order_detail = new OrderDetailVO();
		
		order_detail.setOrder_no(order.getOrder_no());
		order_detail.setProduct_no(vo.getProduct_no());
		order_detail.setProduct_quantity(vo.getProduct_quantity());
		
		orderService.register2(order_detail);
		
		productService.saleCount_modify(vo.getProduct_no(), vo.getProduct_quantity());
		
		rttr.addAttribute("order_no", order.getOrder_no());
		
		return "redirect:/buy/buyResult";
	}
	
	/* 카트 결제 오더 */
	@ResponseBody
	@PostMapping(value="/buy/cart",
				 consumes = "application/json",
				 produces = {MediaType.TEXT_PLAIN_VALUE})
	public String buy_cart(@RequestBody OrderDTO list) {
		
		System.out.println("컨트롤러 실행!! ");
		
		orderService.register(list.getList().get(0));
		
		System.out.println("오더테이블 등록 성공");
		
		OrderVO vo = orderService.read(list.getList().get(0).getMember_no());
		
		System.out.println("중간점검 테스트 성공 ");
		
		for(int i=0; i<list.getList().size(); i++) {
			
			OrderDetailVO order_detail = new OrderDetailVO();
			
			order_detail.setOrder_no(vo.getOrder_no());
			order_detail.setProduct_no(list.getList().get(i).getProduct_no());
			order_detail.setProduct_quantity(list.getList().get(i).getProduct_quantity());
			
			orderService.register2(order_detail);
			
			productService.saleCount_modify(list.getList().get(i).getProduct_no(), list.getList().get(i).getProduct_quantity());
			
			cartService.remove(list.getList().get(i).getCart_no());
		}
		
		System.out.println("결제 완료!!");
		
		Gson gson = new Gson();
		
		String data = String.valueOf(vo.getOrder_no());
		
		System.out.println("형변환 데이터: " + data);
		
		String json = gson.toJson(data);
		
		System.out.println("제이슨 데이터: " + json);
		
		return json;
	}
	
	@RequestMapping("/buy/buyResult")
	public String comple(int order_no, Model model, Principal principal) {
		
		
	if(principal != null) {
		
		MemberVO member = memberService.getMember2(principal.getName());
		
		  
		  model.addAttribute("member", member);
		  
		  List<OrderVO> orders = orderService.result(order_no);
		  
		  Gson gson = new GsonBuilder().create();
		  String json = gson.toJson(orders);
		  
		  model.addAttribute("order_data", json);
		  
		  return "/buy/buyResult";
	} else {
		return "redirect:/auth/loginForm";
	}
		
	}

	
	@RequestMapping("/myPage/myPage")
	public String myPage(Model model, Criterias cri, Principal principal) {
		
		if(principal != null) {
			
			/*
			 * MemberVO member = memberService.getMember2(principal.getName());
			 * 
			 * member_no = member.getMember_no();
			 */
			List<OrderVO> list = orderService.myPage(cri);
			
			Gson gson = new GsonBuilder().create();
			
			String json = gson.toJson(list);
			
			model.addAttribute("list", json);
			
			
			  int total = orderService.getTotalCount(cri);
			  
			  model.addAttribute("pageMaker", new PageDTOS(cri, total));
			 
			
			return "/myPage/myPage";
		} else {
			return "redirect:/auth/loginForm";
		}
					
	}
	
}
