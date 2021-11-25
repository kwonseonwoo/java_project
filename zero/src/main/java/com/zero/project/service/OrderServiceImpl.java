package com.zero.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.project.mapper.OrderMapper;
import com.zero.project.model.Criteria;
import com.zero.project.model.Criterias;
import com.zero.project.model.OrderDetailVO;
import com.zero.project.model.OrderVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_= @Autowired)
	private OrderMapper mapper;
	
	
	@Override
	public void register(OrderVO order) {
		
		mapper.register(order);
	}

	@Override
	public void register2(OrderDetailVO order_detail) {
		
		mapper.register2(order_detail);
	}

	@Override
	public OrderVO read(int member_no) {
		
		return mapper.read(member_no);
	}

	@Override
	public List<OrderVO> result(int order_no) {
		
		return mapper.result(order_no);
	}

	@Override
	public List<OrderVO> myPage(Criterias cri) {
		
		return mapper.myPage(cri);
	}

	@Override
	public int getTotalCount(Criterias cri) {
		
		return mapper.getTotalCount(cri);
	}

}
