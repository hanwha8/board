package com.hanwha.example.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hanwha.example.dao.ProjectDao;
import com.hanwha.example.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao projectDao;
	@Override
	public void insert(ProjectVO projectVO) {
		// TODO Auto-generated method stub
		
		try{
			projectDao.insert(projectVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
