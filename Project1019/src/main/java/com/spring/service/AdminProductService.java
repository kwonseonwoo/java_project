package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ProductVO;

public interface AdminProductService {
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public ProductVO getProduct(int product_no);
	
	public void register(ProductVO vo);
	
	public boolean modify(ProductVO vo);
	
	public boolean remove(int product_no);
	
}
