package com.zero.project.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import com.zero.project.dto.ReplySaveRequestDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@SequenceGenerator(name = "reply_seq",
sequenceName = "reply_seq",
initialValue = 1,
allocationSize = 1)
@Builder
public class Reply {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator ="reply_seq" )
	private int id;
	
	@Column(nullable = false, length = 200)
	private String reply_content;
	
	@ManyToOne //하나의 게시글에 여러 답변
	@JoinColumn(name="bid")
	private Board board;
	
	@ManyToOne //하나의 유저가 여러 답변
	@JoinColumn(name="mid")
	private Member member;
	
	@CreationTimestamp
	private Timestamp createDate;
	
}
