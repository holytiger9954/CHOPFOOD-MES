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
public class RoutDetailController {

	@Autowired
	RoutService routService;

	/**
	 * 라우팅 상세 페이지
	 */
	@RequestMapping("/detail")
	public String routDetail(String routId, Model model) {

		// 라우팅 기본 정보
		RoutDTO rout = routService.selectRoutDetail(routId);

		// 라우팅 공정 흐름
		List<RoutDetailDTO> detailList = routService.selectRoutDetailList(routId);

		model.addAttribute("rout", rout);
		model.addAttribute("detailList", detailList);

		return "P12_rout/routDetail.tiles";
	}
}