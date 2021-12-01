package com.zero.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.project.model.Criteria;
import com.zero.project.model.MemberVO;

@Mapper
public interface AdminMemberMapper {

	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public MemberVO getMember(int member_no);
	
	public int modify(MemberVO vo);
	
	public int remove(int member_no);
	
	public int getTotalCount(Criteria cri);
	
	public MemberVO getMember2(String member_id);
	
}