package kr.or.chop.P12_rout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P12_rout.dto.RoutDTO;
import kr.or.chop.P12_rout.dto.RoutDetailDTO;
import kr.or.chop.P12_rout.service.RoutService;

@Controller
@RequestMapping("/routing")
public class RoutAddController {

	@Autowired
	RoutService routService;

	/**
	 * 라우팅 등록 페이지
	 */
	@RequestMapping("/add")
	public String routAdd(Model model) {

		// 반제품 + 완제품 목록
		List<RoutDTO> routItemList = routService.selectRoutItemList();

		// 공정 목록
		List<RoutDetailDTO> processList = routService.selectProcessList();

		model.addAttribute("routItemList", routItemList);
		model.addAttribute("processList", processList);

		return "P12_rout/routAdd.tiles";
	}

	/**
	 * 라우팅 등록
	 */
	@RequestMapping("/insert")
	public String routInsert(RoutDTO routDTO, RoutDetailDTO detailDTO) {

		routService.insertRoutWithDetail(routDTO, detailDTO.getRoutDtlProcList());

		return "redirect:/routing/list";
	}
}