package kr.or.chop.P14_warehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P14_warehouse.service.WHService;
import kr.or.chop.P15_workplace.dto.WPDTO;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping ("/warehouse")
public class WHListController {
	
	@Autowired
	WHService whService;
	
	@RequestMapping ("/list")
	public String list(
			Model model,
			WHDTO whDTO,
			@RequestParam(value="page", defaultValue="1") int currentPage
		) {
		
		System.out.println("/warehouse/list controller.list");
		System.out.println("whDTO 초기 : " + whDTO);
		
		// 개수 가져와서 페이징
		int listCount = whService.selectWHCount(whDTO);
		PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		// 목록 가져오기
		List<WHDTO> whList = whService.selectAllWH(whDTO, pageInfo);
		
		// 카드 가져오기
		WHDTO whCard = whService.selectWhCardCnt(whDTO);
		
		model.addAttribute("whList", whList);
		model.addAttribute("whCard", whCard);
		model.addAttribute("search", whDTO);
		model.addAttribute("page", pageInfo);
		
		return "P14_warehouse/whList.tiles";
	}

}
