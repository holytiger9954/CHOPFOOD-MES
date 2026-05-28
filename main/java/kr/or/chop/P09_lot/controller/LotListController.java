package kr.or.chop.P09_lot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P09_lot.dto.LotDTO;
import kr.or.chop.P09_lot.service.LotService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/lot")
public class LotListController {
	
	@Autowired
    LotService lotService;

    @RequestMapping("/list")
    public String lotList(LotDTO lotDTO, Model model,
    		@RequestParam(value="page", defaultValue="1")
			int currentPage
		) {

    	int listCount = lotService.selectLotCount(lotDTO);
    	
    	PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);

        List<LotDTO> lotList = lotService.selectAllLot(lotDTO, pageInfo);
        
        int totalCount = lotService.selectLotTotalCount();
        int rawCount = lotService.selectLotTypeCount(lotDTO, "10");
        int semiCount = lotService.selectLotTypeCount(lotDTO, "20");
        int finCount = lotService.selectLotTypeCount(lotDTO, "30");
        int etcCount = lotService.selectLotTypeCount(lotDTO, "40");
        int expCount = lotService.selectLotExpCount(lotDTO);

        model.addAttribute("lotList", lotList);
        model.addAttribute("lotDTO", lotDTO);
        model.addAttribute("page",pageInfo);
        
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("rawCount", rawCount);
        model.addAttribute("semiCount", semiCount);
        model.addAttribute("finCount", finCount);
        model.addAttribute("etcCount", etcCount);
        model.addAttribute("expCount", expCount);

        return "P09_lot/lotList.tiles";
    }
	
}
