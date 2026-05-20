package kr.or.chop.P12_rout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P12_rout.dto.RoutDTO;
import kr.or.chop.P12_rout.service.RoutService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/routing")
public class RoutListController {

	@Autowired
	RoutService routService;

	@RequestMapping("/list")
	public String routList(RoutDTO routDTO, @RequestParam(value = "page", defaultValue = "1") int currentPage,
			Model model) {

		int listCount = routService.selectRoutCount(routDTO);

		PageInfo page = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		List<RoutDTO> routList = routService.selectRoutList(routDTO, page);

		model.addAttribute("routList", routList);
		model.addAttribute("page", page);
		model.addAttribute("search", routDTO);

		return "P12_rout/routList.tiles";
	}
}