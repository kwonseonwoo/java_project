package com.zero.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zero.project.dto.ReplySaveRequestDto;
import com.zero.project.model.Board;
import com.zero.project.model.Member;
import com.zero.project.model.Reply;
import com.zero.project.repository.BoardRepository;
import com.zero.project.repository.MemberRepository;
import com.zero.project.repository.ReplyRepository;

@Service
public class BoardService {

	
		@Autowired
		private BoardRepository boardRepository;
		
		@Autowired
		private MemberRepository memberRepository;
		
		@Autowired
		private ReplyRepository replyRepository;

		public void write(Board board, Member member) {
			board.setBoard_count(0);
			board.setMember(member);
			boardRepository.save(board);
		}

		public Page<Board> 글목록(Pageable pageable) {
			
			return boardRepository.findAll(pageable);
		}
		@Transactional(readOnly = true)
		public Board 상세보기(int bid) {
			return boardRepository.findById(bid)
					.orElseThrow(()-> {
						return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
					});
		}
		
		
		@Transactional
		public void 수정(int bid, Board requestBoard) {
			Board board = boardRepository.findById(bid).orElseThrow(()-> {
				return new IllegalArgumentException("글 찾기 실패");
			});
			board.setBoard_title(requestBoard.getBoard_title());
			board.setBoard_content(requestBoard.getBoard_content());
			
		}
		
		@Transactional
		public void 삭제(int bid) {
			boardRepository.deleteById(bid);
		}
		
		@Transactional
		public void replyWrite(ReplySaveRequestDto replySaveRequestDto) {
			Member member = memberRepository.findById(replySaveRequestDto.getMember_no()).orElseThrow(()-> {
				return new IllegalArgumentException("댓글 쓰기 실패 : 유저 아이디를 찾을 수 없습니다.");
			});
				
			Board board = boardRepository.findById(replySaveRequestDto.getBoardId()).orElseThrow(()-> {
				return new IllegalArgumentException("댓글 쓰기 실패 : 게시글 아이디를 찾을 수 없습니다.");
			});
			
			Reply reply = Reply.builder()
					.member(member)
					.board(board)
					.reply_content(replySaveRequestDto.getReply_content())
					.build();
	
			replyRepository.save(reply);
		}
		
		
		@Transactional
		public void 댓글삭제(int replyId) {
			replyRepository.deleteById(replyId);
			
		}
	
}
