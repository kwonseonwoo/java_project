package com.zero.project.service;

import java.util.List;

import com.zero.project.model.Criteria;
import com.zero.project.model.Criterias;
import com.zero.project.model.OrderDetailVO;
import com.zero.project.model.OrderVO;

public interface OrderService {

	public void register(OrderVO order);
	
	public void register2(OrderDetailVO order_detail);
	
	public OrderVO read(int member_no);
	
	public List<OrderVO> result(int order_no);
	
	public List<OrderVO> myPage(Criterias cri);
	
	public int getTotalCount(Criterias cri);
}
