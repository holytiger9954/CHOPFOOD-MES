package kr.or.chop.P18_defect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.P18_defect.service.DefService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/defect")
public class DefListController {

	@Autowired
	DefService defService;
	
	@RequestMapping("/list")
	public String list(Model model,
			DefDTO defDTO,
			@RequestParam(value="page", defaultValue="1")
			int currentPage
		) {
		
		int listCount = defService.selectDefCount(defDTO);
		
		PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);
		
		
		List<DefDTO> result = defService.defSelectAll(defDTO, pageInfo);
		model.addAttribute("defList", result);
		model.addAttribute("search",defDTO);
		model.addAttribute("page",pageInfo);
		
		return "P18_defect/defectList.tiles";
	}
	
}
