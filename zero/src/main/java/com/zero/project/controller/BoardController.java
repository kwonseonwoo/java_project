package com.zero.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.zero.project.model.Member;
import com.zero.project.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;


	@GetMapping("/board/list")
	public String board(Model model, @PageableDefault(size = 3, sort = "bid", direction = Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.글목록(pageable));
		return "board/list";
	}

	@GetMapping("/board/{bid}") 
	public String findById(@PathVariable int bid, Model model) {
		model.addAttribute("board", boardService.상세보기(bid));
		return "board/detail";
	}
	
	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}
	
	@GetMapping("/board/{bid}/updateForm")
	public String updateForm(@PathVariable int bid, Model model) {
		model.addAttribute("board", boardService.상세보기(bid));
		return "board/updateForm";
	}
	
	
}
