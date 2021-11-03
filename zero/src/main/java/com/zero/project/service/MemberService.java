package com.zero.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.project.model.Member;
import com.zero.project.model.RoleType;
import com.zero.project.repository.MemberRepository;

@Service
public class MemberService {


	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	// 회원가입
	@Transactional
	public void join(Member member) {
		member.setMember_role(RoleType.ADMIN);
		String rawPassword = member.getMember_password();
		String encPassword = encoder.encode(rawPassword);  //해쉬화
		member.setMember_password(encPassword);
		memberRepository.save(member);
	}

	//회원수정
	@Transactional
	public void update(Member member) {
		// 수정시에는 영속성 컨텍스트 Member 오브젝트 영속화시키고, 영속화된 Member 오브젝트를 수정
		// select -> 영속화 하기 위함
		// 영속화된 오브젝트를 변경하면 자동으로 DB에 Update문 실행됨
		Member persistance = memberRepository.findById(member.getMember_no()).orElseThrow(()-> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		String rawPassword = member.getMember_password();
		String encPassword = encoder.encode(rawPassword);
		persistance.setMember_password(encPassword);
		persistance.setMember_username(member.getMember_username());
		persistance.setMember_address(member.getMember_address());
		persistance.setMember_address_no(member.getMember_address_no());
		persistance.setMember_address_detail(member.getMember_address_detail());
		// 함수 종료시 = 서비스 종료 = 트랜잭션 종료 = commit이 자동으로 됨
		// 영속화된 persistance 객체의 변화가 감지되면 더티체킹이 되어 update문을 날려줌.
	}

//	public int checkId(Member member) {
//		int cnt = memberRepository.checkId(member.getMember_id());
//		
//		return cnt;
//	}

}
