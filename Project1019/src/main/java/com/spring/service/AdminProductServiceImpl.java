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
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public ProductVO getProduct(int product_no) {
		return mapper.getProduct(product_no);
	}

	@Override
	public void register(ProductVO vo) {
		mapper.register(vo);
	}

	@Override
	public boolean modify(ProductVO vo) {
		return mapper.modify(vo) ==1;
	}

	@Override
	public boolean remove(int product_no) {
		return mapper.remove(product_no) > 0;
	}

}
