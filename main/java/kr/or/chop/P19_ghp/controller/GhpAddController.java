package kr.or.chop.P19_ghp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.service.GhpService;

@Controller
@RequestMapping("/ghp")
public class GhpAddController {

	@Autowired
	private GhpService ghpService;

	@RequestMapping("/add")
	public String addForm() {
		return "P19_ghp/ghpAdd.tiles";
	}

	@RequestMapping("/insertDo")
	public String insertDo(GhpDTO ghpDTO) {

		ghpService.insertGhp(ghpDTO);

		return "redirect:/ghp/list";
	}
	
}
