package kr.or.chop.P18_defect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.P18_defect.service.DefService;

@Controller
@RequestMapping("/defect")
public class DefDetailController {

	@Autowired
	DefService defService;

	@GetMapping("/detail")
	public String detail(String defTypeId, Model model) {

		DefDTO def = defService.selectDefDetail(defTypeId);

		model.addAttribute("def", def);

		return "P18_defect/defectDetail.tiles";
	}

}
