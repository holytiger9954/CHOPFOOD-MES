package kr.or.chop.P09_lot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P09_lot.dto.LotDTO;
import kr.or.chop.P09_lot.dto.UseDTO;
import kr.or.chop.P09_lot.service.LotService;

@Controller
@RequestMapping("/lot")
public class LotDetailController {

	@Autowired
	LotService lotService;

	@RequestMapping("/detail")
	public String lotDetail(String lotId, Model model) {

		LotDTO lotDTO = lotService.selectLotDetail(lotId);

		if ("30".equals(lotDTO.getItemType())) {

			List<UseDTO> ioList = lotService.selectLotIoList(lotId);

			model.addAttribute("ioList", ioList);
			model.addAttribute("historyType", "IO");

		} else {

			List<UseDTO> useList = lotService.selectLotUseList(lotId);

			model.addAttribute("useList", useList);
			model.addAttribute("historyType", "USE");

		}

		model.addAttribute("lot", lotDTO);

		return "P09_lot/lotDetail.tiles";
	}

}
