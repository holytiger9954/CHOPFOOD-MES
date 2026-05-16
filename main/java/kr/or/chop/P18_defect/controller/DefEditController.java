package kr.or.chop.P18_defect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.P18_defect.service.DefService;

@Controller
@RequestMapping("/defect")
public class DefEditController {

	@Autowired
	DefService defService;
	
	@PostMapping("/update")
	public String updateDefect(DefDTO defDTO) {

	    defService.updateDefect(defDTO);

	    return "redirect:/defect/list";
	}

	@PostMapping("/delete")
	public String deleteDefect(String defTypeId) {

	    defService.deleteDefect(defTypeId);

	    return "redirect:/defect/list";
	}
	
}
