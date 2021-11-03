package com.zero.project.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.zero.project.model.Member;
import com.zero.project.repository.MemberRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{

	@Autowired
	private MemberRepository memberRepository;
	// 스프링이 로그인 요청을 가로챌 때 username, password 변수 2개
	//username이 DB에 있는지만 확인하면 됨
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member principal = memberRepository.findByMember_id(username)
				.orElseThrow(()-> {
					return new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다.:" + username);
				});
		return new PrincipalDetail(principal); //시큐리티 세션에 유저 정보가 저장이 됨
	}

	
}
