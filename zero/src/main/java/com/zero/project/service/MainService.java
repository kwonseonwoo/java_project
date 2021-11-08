package com.zero.project.service;

import java.util.List;

import com.zero.project.model.Criteria;
import com.zero.project.model.ProductVO;

public interface MainService {

	//이 메뉴는 어떠세요?
	public List<ProductVO> recommend();
	
	
	//오늘의 베스트 셀러(오늘)
	public List<ProductVO> today();

	//오늘의 베스트 셀러(이번주)
	public List<ProductVO> week();

	//오늘의 베스트 셀러(이번달)
	public List<ProductVO> month();
	
	
	//새로 나온 메뉴
	public List<ProductVO> news();
	
	//간편 요리
	public List<ProductVO> simple();
	
	//특별한 반찬
	public List<ProductVO> special();
	
	//주류,음료
	public List<ProductVO> beverage();
	
	//간식,간편식
	public List<ProductVO> desert();
	
	/* 네비게이션 항목 출력 */
	public List<ProductVO> getList(String product_type);
	
	//인기
	public List<ProductVO> getList_pop();
	
	//신메뉴
	public List<ProductVO> getList_new();
	
	//선물
	public List<ProductVO> getList_pres();
	
	
	public List<ProductVO> getListWithPaging(Criteria cri);

}
