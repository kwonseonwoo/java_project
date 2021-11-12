package com.zero.project.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zero.project.model.MemberVO;
import com.zero.project.model.ReplyPageDTO;
import com.zero.project.model.ReplyVO;
import com.zero.project.service.AdminMemberService;
import com.zero.project.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@RestController
@AllArgsConstructor
@RequestMapping("/replies")
public class ReplyController {

	@Setter(onMethod_= @Autowired)
	private ReplyService service;
	
	@Setter(onMethod_= @Autowired )
	private AdminMemberService service2;
	
	/* 리뷰 추가 */
	@PostMapping(value="/new",
				 consumes = "application/json",
				 produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo, Principal principal) {
		
		MemberVO member = service2.getMember2(principal.getName());
		
		vo.setMember_no(member.getMember_no());
		
		vo.setMember_username(member.getMember_username());
		
		int insertCount = service.register(vo);
		
		return insertCount ==1? new ResponseEntity<>("등록 성공", HttpStatus.OK):
			   new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	/* 리뷰 리스트 출력 */
	@SuppressWarnings("deprecation")
	@GetMapping(value="/{product_no}/lists.json",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
							MediaType.APPLICATION_XML_VALUE
				})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("product_no") int product_no) {
		
		System.out.println("상품번호: " + product_no);
		
		return new ResponseEntity<ReplyPageDTO>(service.getList(product_no), HttpStatus.OK);
	}
	
	/* 리뷰 조회 */
	@GetMapping(value="/view/{review_no}.json",
				produces = {MediaType.APPLICATION_JSON_VALUE,
							MediaType.APPLICATION_XML_VALUE
				})
	public ResponseEntity<ReplyVO> get(@PathVariable("review_no") int review_no) {
		
		return new ResponseEntity<>(service.read(review_no), HttpStatus.OK);
	}
	
	/* 리뷰 삭제 */
	@DeleteMapping(value="/delete/{review_no}",
				   produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("review_no") int review_no) {
		
		return service.remove(review_no)==1? new ResponseEntity<>("삭제 성공", HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
