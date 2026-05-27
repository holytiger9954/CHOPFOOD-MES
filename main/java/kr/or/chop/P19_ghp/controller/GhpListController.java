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
public class GhpListController {

	@Autowired
	private GhpService ghpService;

	@RequestMapping("/list")
	public String list(GhpDTO ghpDTO, Model model,
			@RequestParam(value="page", defaultValue="1")
			int currentPage
	) {
		
		int listCount = ghpService.selectGhpCount(ghpDTO);
		
		PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);
		
		
		List<GhpDTO> ghpList = ghpService.selectGhpList(ghpDTO, pageInfo);

		model.addAttribute("ghpList", ghpList);
		model.addAttribute("search", ghpDTO);
		model.addAttribute("page", pageInfo);

		return "P19_ghp/ghpList.tiles";
	}
	
}
