package kr.or.chop.P04_sugg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P04_sugg.dto.SuggDTO;
import kr.or.chop.P04_sugg.service.SuggService;

@Controller
@RequestMapping("/sugg")
public class SuggEditController {

    @Autowired
    SuggService suggService;

    @PostMapping("/edit")
    public String edit(SuggDTO dto) {
    	System.out.println("/sugg/edit 실행");

        suggService.updateSugg(dto);

        return "redirect:/sugg/detail?sugg_no="
                + dto.getSugg_no();
    }

    @PostMapping("/delete")
    public String delete(int sugg_no) {

        suggService.deleteSugg(sugg_no);

        return "redirect:/sugg/list.tiles";
    }
}
