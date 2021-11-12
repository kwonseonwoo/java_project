package com.zero.project.service;

import java.util.List;


import com.zero.project.model.Criteria;
import com.zero.project.model.MemberVO;


public interface AdminMemberService {
	
	public MemberVO getMember(int member_no);
	
	public boolean modify(MemberVO vo);
	
	public boolean remove(int member_no);
	
	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public MemberVO getMember2(String member_id);
	
}
