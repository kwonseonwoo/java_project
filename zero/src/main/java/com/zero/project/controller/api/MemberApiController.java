package com.zero.project.controller.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.zero.project.dto.ResponseDto;
import com.zero.project.model.Member;
import com.zero.project.service.MemberService;

@RestController
public class MemberApiController {

	@Autowired
	private MemberService memberService;

	@PostMapping("/api/member")
	public ResponseDto<Integer> save(@RequestBody Member member) {
		System.out.println("MemberApiController:save 호출");
		int result = memberService.join(member);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}

	@PostMapping("/api/member/login") 
	public ResponseDto<Integer> login(@RequestBody Member member, HttpSession session){
	 System.out.println("MemberApiController:login 호출"); 
	 Member principal = memberService.login(member); //principal(접근주체) if(principal != null) {
	if(principal != null) {
		 session.setAttribute("principal", principal);
	 }

	return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
}

}
