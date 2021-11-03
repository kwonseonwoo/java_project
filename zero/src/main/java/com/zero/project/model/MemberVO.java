package com.zero.project.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private int member_no;
	private String member_id;
	private String member_password;
	private String member_username;
	private String member_address_no;
	private String member_address;
	private String member_address_detail;
	private String member_reference;
	private Date member_regDate;
	
}
