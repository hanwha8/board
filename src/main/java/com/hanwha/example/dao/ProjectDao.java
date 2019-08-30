package com.hanwha.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hanwha.example.dto.ProjectVO;

@Component
public class ProjectDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시글 작성
	public void insert(ProjectVO projectVO) {
		sqlSession.insert("board.insert",projectVO);
	}

}
