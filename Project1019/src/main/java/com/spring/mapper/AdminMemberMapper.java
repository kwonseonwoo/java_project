package com.spring.mapper;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;

public interface AdminMemberMapper {

	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public MemberVO getMember(int member_no);
	
	public int modify(MemberVO vo);
	
	public int remove(int member_no);
	
	public int getTotalCount(Criteria cri);
	
}
