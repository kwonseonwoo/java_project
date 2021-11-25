package com.zero.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.project.model.CartVO;

@Mapper
public interface CartMapper {
	
	public int register(CartVO vo);
	
	public CartVO getCart(int member_no, int product_no);
	
	public int modify(CartVO vo);
	
	public CartVO count(int member_no);
	
	public List<CartVO> getList(int member_no);
	
	
	public int remove(int cart_no);
	
	public int modifies(CartVO vo);
	
	public CartVO getPurchase(int cart_no);

}
