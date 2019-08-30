package com.hanwha.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hanwha.example.dto.BoardVO;

@Component
public class BoardDao {
	/*
	 * DaO는 실질적으로 DB를 조작하는 객체를 말한다.
	 * 즉 Board라는 DB를 실질적으로 조작하기 위한 객체를 만들어 둔 것이다.
	 * 
	 */
	
	@Autowired
	private SqlSession sqlSession;
	/*
	 * SqlSession이라는 것은 BoardMapper에 있는 쿼리문들을 실질적으로 실행시켜줌.
	 */
	
	public void insert(BoardVO vo) throws Exception{
		/*
		 * board.insert에서 board는 BoardMapper의 namespace
		 * baord.insert는 board라는 xml namespace에서 insert이름을 가진 쿼리를 실행시킨다.
		 */
		sqlSession.insert("board.insert",vo);
	}
	public List<BoardVO> list()throws Exception{
		return sqlSession.selectList("listAll");
	}
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("board.view", bno);
	}
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("board.increaseViewcnt", bno);
	}

	// 01. 게시글 작성
	// 02. 게시글 상세보기
	// 03. 게시글 수정
	// 04. 게시글 삭제
	// 05. 게시글 전체 목록
	// 게시글 조회수 증가
}
