package com.zero.project.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class OrderDTO {
	
	private List<OrderVO> list;
	
	public OrderDTO() {}
}
