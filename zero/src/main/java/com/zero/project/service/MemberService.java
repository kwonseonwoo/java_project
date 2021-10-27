package com.zero.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.project.model.Member;
import com.zero.project.repository.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	// 회원가입
	@Transactional
	public int join(Member member) {
		try {
			memberRepository.save(member);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 로그인

	@Transactional(readOnly = true)
	public Member login(Member member) {
		return memberRepository.login(member.getMember_id(), member.getMember_password());
	}

}
