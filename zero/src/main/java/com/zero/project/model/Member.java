package com.zero.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(name = "member_seq",
				   sequenceName = "member_seq",
				   initialValue = 1,
				   allocationSize = 1
				   )
public class Member {

	@Id //primary key
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
							   generator = "member_seq") //DB의 넘버링 전략을 따름
	private int member_no;
	
	@Column(nullable = false, length=50, unique = true)
	private String member_id;
	
	@Column(nullable = false, length = 100)
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
	
	@Enumerated(EnumType.STRING)
	private RoleType member_role; 
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	@CreationTimestamp //가입 시간 자동 입력
	private Timestamp member_regDate;
}
