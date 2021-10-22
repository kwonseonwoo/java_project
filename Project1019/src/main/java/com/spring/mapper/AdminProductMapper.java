package com.spring.mapper;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ProductVO;

public interface AdminProductMapper {
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public void register(ProductVO vo);
	
	public ProductVO getProduct(int product_no);
	
	public int modify(ProductVO vo);
	
	public int remove(int product_no);
	
	public int getTotalCount(Criteria cri);
	
}
