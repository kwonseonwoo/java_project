package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PageDTO;
import com.spring.service.AdminMemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/admin")
public class AdminMemberController {

	@Setter(onMethod_= @Autowired)
	private AdminMemberService service;
	
	
	@RequestMapping("/member/list")
	public void list(Model model, Criteria cri) {
		
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotalCount(cri);
	
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@RequestMapping("/member/view")
	public void view(int member_no, Model model) {
		
		MemberVO vo = service.getMember(member_no);
		
		model.addAttribute("member", vo);
		
	}
	
	@PostMapping("/member/modify")
	public String modify(MemberVO vo) {
		
		service.modify(vo);
		
		return "redirect:/admin/member/list";
	}
	
	@RequestMapping("/member/remove")
	public String remove(int member_no) {
		
		service.remove(member_no);
		
		return "redirect:/admin/member/list";
		
	}
	
}









