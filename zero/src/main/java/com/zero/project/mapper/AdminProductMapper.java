package com.zero.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.project.model.Criteria;
import com.zero.project.model.ProductVO;

@Mapper
public interface AdminProductMapper {
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public void register(ProductVO vo);
	
	public ProductVO getProduct(int product_no);
	
	public int modify(ProductVO vo);
	
	public int remove(int product_no);
	
	public int getTotalCount(Criteria cri);
	
	public int saleCount_modify(ProductVO vo);
	
}
