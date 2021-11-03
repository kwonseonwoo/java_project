package com.zero.project.config.auth;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.zero.project.model.Member;

import lombok.Getter;

@Getter
public class PrincipalDetail implements UserDetails{
	
	private Member member;
	
	public PrincipalDetail(Member member) {
		this.member = member;
	}


	@Override
	public String getPassword() {
		return member.getMember_password();
	}

	@Override
	public String getUsername() {
		return member.getMember_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}
	
}
