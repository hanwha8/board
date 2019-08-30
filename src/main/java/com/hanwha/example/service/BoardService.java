package com.hanwha.example.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hanwha.example.dto.BoardVO;

public interface BoardService {
	//01. 게시글 작성
	public void insert(BoardVO boardVO);
	//02. 게시글 상세보기
	public List<BoardVO> list() throws Exception ;
	public BoardVO read(int bno) throws Exception;
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;
	
	
	
	// 
	// 03. 게시글 수정
	// 04. 게시글 삭제
	// 05. 게시글 전체 목록
	// public List<BoardVO> listAll() throws Exception;
	// 06. 게시글 조회
}
