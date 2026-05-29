package kr.or.chop.P19_ghp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.service.GhpService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/ghp")
public class GhpDetailController {

	@Autowired
	private GhpService ghpService;

	@RequestMapping("/detail")
	public String detail(String ghpId, Model model,
			@RequestParam(value="page", defaultValue="1")
			int currentPage
		) {

		int listCount = ghpService.selectGlogCount(ghpId);
		
		PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);
		
		GhpDTO ghp = ghpService.selectGhpDetail(ghpId);
		
		List<GhpDTO> glogList = ghpService.selectGlogList(ghpId, pageInfo);

		model.addAttribute("ghp", ghp);
		model.addAttribute("glogList", glogList);
		model.addAttribute("page", pageInfo);

		return "P19_ghp/ghpDetail.tiles";
	}

	@RequestMapping("/delete")
	public String delete(String ghpId) {

		ghpService.deleteGhp(ghpId);

		return "redirect:/ghp/list";
	}
	
}
