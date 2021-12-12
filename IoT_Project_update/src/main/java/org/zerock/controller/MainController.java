package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {

	private BoardService boardService;
	

	
	@GetMapping({"/", "/home1"})
	public String main(Model model) {
		model.addAttribute("list", boardService.getList());
		
		return "home1";
	}
	
}
