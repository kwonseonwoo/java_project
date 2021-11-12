package com.zero.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.project.mapper.AdminProductMapper;
import com.zero.project.mapper.ReplyMapper;
import com.zero.project.model.ReplyPageDTO;
import com.zero.project.model.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private AdminProductMapper productMapper;
	
	@Override
	public int register(ReplyVO vo) {
		
		productMapper.replyCnt_modify(vo.getProduct_no());
		
		return mapper.register(vo);
	}

	@Override
	public int remove(int review_no) {
		
		ReplyVO vo = mapper.read(review_no);
		
		productMapper.replyCnt_modify2(vo.getProduct_no());
		
		return mapper.remove(review_no);
	}

	@Override
	public ReplyPageDTO getList(int product_no) {
		
		return new ReplyPageDTO(mapper.getList(product_no));
		
	}

	@Override
	public ReplyVO read(int review_no) {
		
		return mapper.read(review_no);

	}

}
