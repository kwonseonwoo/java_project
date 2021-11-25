package com.zero.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.project.mapper.CartMapper;
import com.zero.project.model.CartVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	@Setter(onMethod_= @Autowired)
	private CartMapper mapper;
	
	@Override
	public int register(CartVO vo) {
		
		int score = 0;
		
		CartVO getVO = mapper.getCart(vo.getMember_no(), vo.getProduct_no());
		/*
		 * System.out.println("카트 등록 서비스에서 받아온 객체" + getVO);
		 * System.out.println("score1: " + score);
		 */
		if(getVO != null) {
			score = 0;
		} else if(getVO == null) {
			score = 1;
		}
		/*
		 * System.out.println("score2: " + score); System.out.println("조건문까지 성공적!");
		 */
		
		return score == 0 ? mapper.modify(vo) : mapper.register(vo);
	}

	@Override
	public CartVO count(int member_no) {
		
		return mapper.count(member_no);
	}

	@Override
	public List<CartVO> getList(int member_no) {
		
		return mapper.getList(member_no);
	}

	@Override
	public int modifies(CartVO vo) {
		
		return mapper.modifies(vo);
	}

	@Override
	public int remove(int cart_no) {
		
		return mapper.remove(cart_no);
	}

	@Override
	public CartVO getPurchase(int cart_no) {
		
		return mapper.getPurchase(cart_no);
	}

	/*
	 * @Override public CartVO getCart(int member_no, int product_no) {
	 * 
	 * return mapper.getCart(member_no, product_no); }
	 * 
	 * @Override public boolean modify(CartVO vo) {
	 * 
	 * return mapper.modify(vo)==1; }
	 */

}
