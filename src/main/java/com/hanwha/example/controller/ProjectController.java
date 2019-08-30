package com.hanwha.example.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

@RestController
@RequestMapping("/board/project")
public class ProjectController {
	
	@Autowired
	BoardService boardService;
	@RequestMapping(value ="/hello", method = {RequestMethod.POST})
	public List<BoardVO> list() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",boardService.list());
		System.out.println("log");
		return boardService.list();
	}
	
	
	
	
	
	
}
