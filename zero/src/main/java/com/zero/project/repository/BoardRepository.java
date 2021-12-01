package com.zero.project.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.zero.project.model.Board;
import com.zero.project.model.Member;

public interface BoardRepository extends JpaRepository<Board, Integer> {

	

}