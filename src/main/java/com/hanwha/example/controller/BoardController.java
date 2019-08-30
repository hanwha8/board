package com.hanwha.example.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	
	// 01. 게시글 목록
	@RequestMapping(value = "list.do", method = RequestMethod.POST)
	public ModelAndView list() throws Exception {
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",boardService.list());
		System.out.println(mav.toString());
		mav.setViewName("board/list");
		return mav;
	}

	// 02_01. 게시글 작성화면
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write() {
		return "board/write";
	}

	// 02_02. 게시글 작성처리
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute BoardVO boardVO) throws Exception {
		boardService.insert(boardVO);
		
		String url = "redirect:/board/list.do";
		System.out.println("Test");
		return new ModelAndView(url); 
		
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception {
		// 조회수 증가 처리
		
		boardService.increaseViewcnt(bno, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto",boardService.read(bno));
		return mav;
	}

	// 04. 게시글 수정
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update() throws Exception {
		// return "redirect:list.do";
		return "";
	}

	// 05. 게시글 삭제
	@RequestMapping("delete.do")
	public String delete() throws Exception {
		return "redirect:list.do";
	}
	@RequestMapping(value ="list.do",method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		List<BoardVO> list = boardService.list();
		model.addAttribute("list",list);
		
	}

}
