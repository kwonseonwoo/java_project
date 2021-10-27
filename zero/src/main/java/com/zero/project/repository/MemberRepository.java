package com.zero.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.zero.project.model.Member;

public interface MemberRepository extends JpaRepository<Member, Integer> {

//	Member findByMember_idAndMember_password(String member_id, String member_password);
	
	@Query(value = "select * from Member where member_id = ? and member_password = ?", nativeQuery = true)
	Member login(String member_id, String password);
}
