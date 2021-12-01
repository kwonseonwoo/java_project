package com.zero.project.controller.api;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticatedPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zero.project.config.auth.PrincipalDetail;
import com.zero.project.dto.ReplySaveRequestDto;
import com.zero.project.dto.ResponseDto;
import com.zero.project.model.Board;
import com.zero.project.model.Member;
import com.zero.project.model.Reply;
import com.zero.project.repository.MemberRepository;
import com.zero.project.service.BoardService;
import com.zero.project.service.MemberService;

import oracle.jdbc.proxy.annotation.Post;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;

	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) {
		boardService.write(board, principal.getMember());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/api/board/{bid}")
	public ResponseDto<Integer> update(@PathVariable int bid, @RequestBody Board board) {
		boardService.수정(bid, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	/*
	 * @RequestMapping(value = "/api/board/{bid}", method = RequestMethod.DELETE)
	 * public ResponseDto<Integer> deleteById(@PathVariable int bid) {
	 * boardService.삭제(bid); return new
	 * ResponseDto<Integer>(HttpStatus.OK.value(),1); }
	 */

	@PostMapping("/api/board/{boardId}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {

		boardService.replyWrite(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/api/board/{bid}")
	public ResponseDto<Integer> deleteById(@PathVariable int bid) {
		boardService.삭제(bid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyId) {
		boardService.댓글삭제(replyId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

}
