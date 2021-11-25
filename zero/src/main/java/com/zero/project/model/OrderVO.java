package com.zero.project.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class OrderVO {

	private int order_no;
	private int member_no;
	private Date order_date;
	
	/* orderDetail table 컬럼 */
	private int order_detail_no;
	private int product_no;
	private int product_quantity;
	
	/* cart_no 컬럼 추가 */
	private int cart_no;
	
	/* Product table과의 조인을 위한 필드 추가 */
	private String product_name;
	private int product_price;
	private String product_img1;
	
	private Date sample;
	
	
	public OrderVO() {}
	
}
