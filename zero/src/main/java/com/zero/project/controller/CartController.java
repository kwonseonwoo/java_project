package com.zero.project.controller;


import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.zero.project.model.CartVO;
import com.zero.project.model.MemberVO;
import com.zero.project.service.AdminMemberService;
import com.zero.project.service.CartService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
public class CartController {

	@Setter(onMethod_= @Autowired)
	private CartService service;

	@Setter(onMethod_= @Autowired)
	private AdminMemberService service2;
	
	@ResponseBody
	@PostMapping(value="/cart/new",
				 consumes = "application/json",
				 produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CartVO vo) {
		
		int insertCount = service.register(vo);
		
		return insertCount == 1? new ResponseEntity<>("장바구니에 상품이 등록되었습니다.", HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@RequestMapping("/cart/cart")
	public void cart(Model model) {
		
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
	
	/* 카트 리스트 출력 */
	@ResponseBody
	@GetMapping(value="/cart/list",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
						    MediaType.APPLICATION_XML_VALUE
				})
	public String cartList(Principal principal) {
		
		MemberVO member = service2.getMember2(principal.getName());
		
		List<CartVO> vo = service.getList(member.getMember_no());
		
		Gson gson = new Gson();
		
		String json = gson.toJson(vo);
		
		return json;
	}
	
	
	/* 카트 수정 작업 */
	@ResponseBody
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
							 value="/cart/{cart_no}",
							 consumes = "application/json",
							 produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@PathVariable("cart_no")int cart_no, 
										     		  @RequestBody CartVO vo ) {
		
		return service.modifies(vo)==1? new ResponseEntity<>("수정 성공", HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/* 카트 삭제 작업 */
	@ResponseBody
	@DeleteMapping(value="/cart/{cart_no}",
				   produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("cart_no") int cart_no) {
		
		/*
		 * for(int i=0; i<cart_no.length; i++) { System.out.println("컨트롤러 카트 넘버" +
		 * cart_no); }
		 * 
		 * int sco = 0;
		 */
		
/*		if(cart_no.length == 1) {
			
		} else {
			for(int i=0; i<cart_no.length; i++) {
				service.remove(cart_no[i]);
				sco = 1;
			}*/
			return service.remove(cart_no)==1 ? new ResponseEntity<String>("삭제 성공",HttpStatus.OK)
					:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

