package com.zero.project.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.zero.project.model.Member;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	// select * from member where member_id = ?;
//	Optional<Member> findByMember_id(String username);
	
	@Query(value = "select * from member where member_id = ?", nativeQuery = true)
	Optional<Member> findByMember_id(String member_id);

	/*
	 * @Query(value = "select * from member where member_id = ?", nativeQuery =
	 * true) Optional<Member> findMember_id(String member_id);
	 */
}
//@Query(value = "select * from Member where member_id = ? and member_password = ?", nativeQuery = true)
//Member login(String member_id, String password);


//@Query(value = "select count(member_id) from Member where member_id =?", nativeQuery = true)
//int checkId(String member_id);