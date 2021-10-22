package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.ProductVO;
import com.spring.mapper.AdminProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AdminProductServiceImpl implements AdminProductService{
	
	@Setter(onMethod_= @Autowired)
	private AdminProductMapper mapper;
	
	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
		return null;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return 0;
	}

	@Override
	public ProductVO getProduct(int product_no) {
		return null;
	}

	@Override
	public void register(ProductVO vo) {
		
	}

	@Override
	public boolean modify(ProductVO vo) {
		return false;
	}

	@Override
	public boolean remove(int product_no) {
		return false;
	}

}
