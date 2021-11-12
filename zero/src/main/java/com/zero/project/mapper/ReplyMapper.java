package com.zero.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zero.project.model.ReplyVO;

@Mapper
public interface ReplyMapper {

	public int register(ReplyVO vo);
	
	public ReplyVO read(int review_no);
	
	public int remove(int review_no);
	
	public List<ReplyVO> getList(@Param("product_no")int product_no);
	
}
