package com.zero.project.service;

import java.util.List;

import com.zero.project.model.Criteria;
import com.zero.project.model.ProductVO;


public interface AdminProductService {
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public ProductVO getProduct(int product_no);
	
	public void register(ProductVO vo);
	
	public boolean modify(ProductVO vo);
	
	public boolean remove(int product_no);
	
	public boolean saleCount_modify(ProductVO vo);
	
	/* public boolean replyCnt_modify(ProductVO vo); */
	
}
