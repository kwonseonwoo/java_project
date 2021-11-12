package com.zero.project.service;

import java.util.List;

import com.zero.project.model.ReplyPageDTO;
import com.zero.project.model.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public int remove(int review_no);
	
	public ReplyPageDTO getList(int product_no);
	
	public ReplyVO read(int review_no);
	
}
