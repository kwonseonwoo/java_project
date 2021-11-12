package com.zero.project.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int review_no;
	
	//상품 번호
	private int product_no;
	
	//멤버 번호
	private int member_no;
	
	private String member_username;
	
	private String review_content;
	private Date review_regDate;
	private String review_score;
	
	private String average;
}
