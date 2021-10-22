package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.mapper.AdminMemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {

	@Setter(onMethod_= @Autowired)
	private AdminMemberMapper mapper;

	@Override
	public MemberVO getMember(int member_no) {
		
		return mapper.getMember(member_no);
	}

	@Override
	public boolean modify(MemberVO vo) {

		return mapper.modify(vo)==1;
	}

	@Override
	public boolean remove(int member_no) {

		return mapper.remove(member_no)>0;
	}

	@Override
	public List<MemberVO> getList() {

		return mapper.getList();
	}

	@Override
	public List<MemberVO> getListWithPaging(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {

		return mapper.getTotalCount(cri);
	}
	
}
