package kr.or.chop.P04_sugg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P04_sugg.dto.SuggDTO;
import kr.or.chop.P04_sugg.service.SuggService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/sugg")
public class SuggListController {

    @Autowired
    SuggService suggService;
    
    @RequestMapping("/list")
    public String list(
    		SuggDTO suggDTO,
    		@RequestParam(value = "page", defaultValue = "1") 
            int currentPage,
    		Model model) {
    	System.out.println("/sugg/list 실행");
    	
    	 int listCount = suggService.selectSuggCount(suggDTO);

         PageInfo pageInfo = Pagination.getPageInfo(
                 listCount,
                 currentPage,
                 5,
                 10
         );
    	
        List<SuggDTO> list =
                suggService.selectSuggList(suggDTO,pageInfo);

        model.addAttribute("list", list);
        model.addAttribute("suggDTO", suggDTO);
        model.addAttribute("page", pageInfo);
        

        return "P04_sugg/suggList.tiles";
    }
}