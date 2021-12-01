package com.zero.project.controller.api;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticatedPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zero.project.config.auth.PrincipalDetail;
import com.zero.project.dto.ResponseDto;
import com.zero.project.model.Member;
import com.zero.project.repository.MemberRepository;
import com.zero.project.service.MemberService;

import oracle.jdbc.proxy.annotation.Post;

@RestController
public class MemberApiController {

	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberRepository memberRepository;

	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody Member member) {
		System.out.println("MemberApiController:save 호출");
		memberService.join(member);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/member")
	public ResponseDto<Integer> update(@RequestBody Member member) { 
		memberService.update(member);
		//세션 등록
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(member.getMember_id(), member.getMember_password()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/member/checkId")
	public String checkId(@RequestBody Member member, Model model) {
		String result = memberService.check(member);
		System.out.println("result : " + result);
		return memberService.check(member);
	}
	
	
	
}
