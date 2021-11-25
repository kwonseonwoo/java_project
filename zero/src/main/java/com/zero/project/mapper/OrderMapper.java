package com.zero.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.zero.project.model.Criteria;
import com.zero.project.model.Criterias;
import com.zero.project.model.OrderDetailVO;
import com.zero.project.model.OrderVO;

@Mapper
public interface OrderMapper {

	//Order 등록
	public void register(OrderVO order);
	
	//OrderDetail 등록
	public void register2(OrderDetailVO order_detail);
	
	//order_no 조회
	public OrderVO read(int member_no);
	
	//바로 주문 후 result 출력을 위한 List
	public List<OrderVO> result(int order_no);
	
	//마이페이지 리스트 출력
	public List<OrderVO> myPage(Criterias cri); 
	public int getTotalCount(Criterias cri);
}
