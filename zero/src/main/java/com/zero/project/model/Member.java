package com.zero.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Member {

	@Id //primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) //DB의 넘버링 전략을 따름
	private int member_no;
	
	@Column(nullable = false, length=50, unique = true)
	private String member_id;
	
	@Column(nullable = false, length=50)
	private String member_password;
	
	@Column(nullable = false, length = 20)
	private String member_username;
	
	@Column(nullable = false, length = 100)
	private String member_address_no;
	
	@Column(nullable = false, length = 100)
	private String member_address;
	
	@Column(nullable = false, length = 100)
	private String member_address_detail;
	
	@Column(length=50)
	private String member_reference;
	
	@CreationTimestamp //가입 시간 자동 입력
	private Timestamp member_regDate;
}
