package com.zero.project.service;

import java.util.List;

import com.zero.project.model.CartVO;

public interface CartService {

	public int register(CartVO vo);
	
	/*
	 * public CartVO getCart(int member_no, int product_no);
	 * 
	 * public boolean modify(CartVO vo);
	 */
	
	public CartVO count(int member_no);
	
	public List<CartVO> getList(int member_no);
	
	public int modifies(CartVO vo);
	
	public int remove(int cart_no);
	
	public CartVO getPurchase(int cart_no);
}
