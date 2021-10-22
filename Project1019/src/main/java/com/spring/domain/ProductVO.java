package com.spring.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	private int product_no;
	private String product_name;
	private int product_price;
	
	/* 이미지 파일 처리를 위한 임시 속성 */
	private MultipartFile uploadFile;
	
	private String product_img;
	private String product_type;
	private Date product_regDate;
	private int product_saleCount;
}
