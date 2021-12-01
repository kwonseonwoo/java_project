package com.zero.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.zero.project.dto.ReplySaveRequestDto;
import com.zero.project.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{

}
