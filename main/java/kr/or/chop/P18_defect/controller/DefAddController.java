package kr.or.chop.P18_defect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.P18_defect.service.DefService;

@Controller
@RequestMapping("/defect")
public class DefAddController {

	@Autowired
    private DefService defService;
	
	// 등록 페이지 이동
    @RequestMapping("/add")
    public String defAddForm() {
        return "P18_defect/defectAdd.tiles";
    }

    // 거래처 등록
    @PostMapping("/insert")
    public String insertDef(
            @ModelAttribute DefDTO defDTO) {

        defService.insertDef(defDTO);

        return "redirect:/defect/list";
    }
	
}
