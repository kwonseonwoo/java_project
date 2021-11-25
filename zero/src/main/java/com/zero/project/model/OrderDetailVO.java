package com.zero.project.model;

import lombok.Data;

@Data
public class OrderDetailVO {

	private int order_detail_no;
	private int order_no;
	private int product_no;
	private int product_quantity;
}
