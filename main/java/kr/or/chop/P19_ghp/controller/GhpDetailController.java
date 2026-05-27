package kr.or.chop.P19_ghp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.service.GhpService;

@Controller
@RequestMapping("/ghp")
public class GhpDetailController {

	@Autowired
	private GhpService ghpService;

	@RequestMapping("/detail")
	public String detail(String ghpId, Model model) {

		GhpDTO ghp = ghpService.selectGhpDetail(ghpId);

		model.addAttribute("ghp", ghp);

		return "P19_ghp/ghpDetail.tiles";
	}

	@RequestMapping("/delete")
	public String delete(String ghpId) {

		ghpService.deleteGhp(ghpId);

		return "redirect:/ghp/list";
	}
	
}
