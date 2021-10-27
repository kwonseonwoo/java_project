package com.zero.project.test;

import java.util.List;
import java.util.function.Supplier;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.zero.project.model.Member;
import com.zero.project.repository.MemberRepository;

@RestController
public class DummyController {

	@Autowired
	private MemberRepository memberRepository;
	
	//localhost:8000/zero/dummy/members
	@GetMapping("/dummy/members")
	public List<Member> list() {
		return memberRepository.findAll();
	}
	
	@GetMapping("/dummy/member/{member_no}")
	public Member detail(@PathVariable int member_no) {
		Member member = memberRepository.findById(member_no).orElseThrow(new Supplier<IllegalArgumentException>() {

			@Override
			public IllegalArgumentException get() {
				// TODO Auto-generated method stub
				return new IllegalArgumentException("해당 유저는 없습니다 id : " + member_no);
			}
		});
		return member;
	}
	
	// http://localhost:8000/zero/dummy/join
	@PostMapping("/dummy/join") //insert
	public String join(Member member) {
		System.out.println("member_no" + member.getMember_no());
		System.out.println("member_id" + member.getMember_id());
		System.out.println("member_password" + member.getMember_password());
		System.out.println("member_username" + member.getMember_username());
		System.out.println("member_address" + member.getMember_address());
		System.out.println("member_address_no" + member.getMember_address_no());
		System.out.println("member_address_detail" + member.getMember_address_detail());
		System.out.println("member_reference" + member.getMember_reference());
		System.out.println("member_regDate" + member.getMember_regDate());
		
		memberRepository.save(member);
		return "회원가입 완료";
	} 
	
	//localhost:8000/zero/dummy/member/delete/{member_no}
	@DeleteMapping("/dummy/member/delete/{member_no}") 
	public String delete(@PathVariable int member_no) {
	try {
		memberRepository.deleteById(member_no);
	} catch (EmptyResultDataAccessException e) {
		return "삭제 실패";
	}
	return "삭제완료" + member_no +"< 삭제";
	}
	@Transactional
	@PutMapping("/dummy/member/{member_no}")
	public Member memberUpdate(@PathVariable int member_no, @RequestBody Member requestMember) {
		System.out.println("member_no: " + member_no);
		System.out.println("member_password" + requestMember.getMember_password());
		System.out.println("member_username" + requestMember.getMember_username());
		
		Member member = memberRepository.findById(member_no).orElseThrow(()-> {
			return new IllegalArgumentException("수정 실패");
		});
		member.setMember_password(requestMember.getMember_password());
		member.setMember_username(requestMember.getMember_username());
		return member;
	}
}
