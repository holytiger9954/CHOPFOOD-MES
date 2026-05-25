package kr.or.chop.P07_qc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P07_qc.dto.QcDTO;
import kr.or.chop.P07_qc.service.QcService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/quality")
public class QcListController {

	 @Autowired
	    private QcService qcService;

	    @RequestMapping("/list")
	    public String qcList(QcDTO qcDTO, Model model,
	            @RequestParam(value = "page", defaultValue = "1") int currentPage) {

	        int listCount = qcService.selectQcCount(qcDTO);

	        PageInfo pageInfo = Pagination.getPageInfo(
	                listCount,
	                currentPage,
	                5,
	                10);

	        List<QcDTO> qcList = qcService.selectQcList(qcDTO, pageInfo);
	        QcDTO summary = qcService.selectQcSummary(qcDTO);

	        model.addAttribute("qcList", qcList);
	        model.addAttribute("summary", summary);
	        model.addAttribute("search", qcDTO);
	        model.addAttribute("page", pageInfo);

	        return "P07_qc/qcList.tiles";
	    }
	
}
