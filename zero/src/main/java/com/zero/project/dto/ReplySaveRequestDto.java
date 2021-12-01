package com.zero.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReplySaveRequestDto {
	private int member_no;
	private int boardId;
	private String reply_content;
}
