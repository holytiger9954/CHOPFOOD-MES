package kr.or.chop.P19_ghp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.service.GhpService;

@Controller
@RequestMapping("/ghp")
public class GhpEditController {

	@Autowired
	private GhpService ghpService;

	@RequestMapping("/update")
	public String updateForm(String ghpId, Model model) {

		GhpDTO ghp = ghpService.selectGhpDetail(ghpId);

		if (ghp.getGhpWhType() != 0) {
			ghp.setTargetType("WH");
		} else if (ghp.getGhpWpType() != 0) {
			ghp.setTargetType("WP");
		} else {
			ghp.setTargetType("");
		}

		model.addAttribute("ghp", ghp);

		return "P19_ghp/ghpEdit.tiles";
	}

	@RequestMapping("/updateDo")
	public String updateDo(GhpDTO ghpDTO) {

		ghpService.updateGhp(ghpDTO);

		return "redirect:/ghp/detail?ghpId=" + ghpDTO.getGhpId();
	}
	
}
