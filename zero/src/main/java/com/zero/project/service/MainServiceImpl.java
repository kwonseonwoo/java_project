package com.zero.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.project.mapper.MainMapper;
import com.zero.project.model.Criteria;
import com.zero.project.model.ProductVO;
import com.zero.project.model.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MainServiceImpl implements MainService {
	
	@Setter(onMethod_= @Autowired)
	private MainMapper mapper;

	//이  메뉴는 어떠세요?
	@Override
	public List<ProductVO> recommend() {
		
		return mapper.recommend();
	}

	//오늘의 베스트 셀러(오늘)
	@Override
	public List<ProductVO> today() {
		
		return mapper.today();
	}
	
	//오늘의 베스트 셀러(이번주)
	@Override
	public List<ProductVO> week() {
		
		return mapper.week();
	}

	//오늘의 베스트 셀러(이번달)
	@Override
	public List<ProductVO> month() {
		
		return mapper.month();
	}

	//새로 나온 메뉴
	@Override
	public List<ProductVO> news() {
		
		return mapper.news();
	}

	//간편 요리
	@Override
	public List<ProductVO> simple() {
		
		return mapper.simple();
	}

	//특별한 반찬
	@Override
	public List<ProductVO> special() {
		
		return mapper.special();
	}

	//주류, 음료
	@Override
	public List<ProductVO> beverage() {
		
		return mapper.beverage();
	}

	//간식과 간편식
	@Override
	public List<ProductVO> desert() {
		
		return mapper.desert();
	}

	/* 네비게이션 항목 출력 */
	@Override
	public List<ProductVO> getList(String product_type) {
		
		return mapper.getList(product_type);
	}

	//인기
	@Override
	public List<ProductVO> getList_pop() {
		
		return mapper.getList_pop();
	}

	//신메뉴
	@Override
	public List<ProductVO> getList_new() {
		
		return mapper.getList_new();
	}

	//선물
	@Override
	public List<ProductVO> getList_pres() {
		
		return mapper.getList_pres();
	}

	
	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
	
		return mapper.getListWithPaging(cri);
	}

	@Override
	public ReplyVO avg(int product_no) {
		
		return mapper.avg(product_no);
	}


	

}
