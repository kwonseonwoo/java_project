package com.zero.project.model;

import lombok.Data;

@Data
public class CartVO {
	
	/* 카트 번호 */
	private int cart_no;
	
	/* 멤버 번호 */
	private int member_no;
	
	/* 상품 번호 */
	private int product_no;
	
	/* 카트에 담긴 상품 수량*/
	private int product_quantity;
	
	/* Join을 위해 필요한 product table column */
	private String product_name;
	private int product_price;
	private String product_img1;
	
	private int counts;
	
}
