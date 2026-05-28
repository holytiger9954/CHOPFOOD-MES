package kr.or.chop.P08_stock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P08_stock.dto.StockDTO;
import kr.or.chop.P08_stock.service.StockService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/stock")
public class StockListController {

	@Autowired
	StockService stockService;

	@RequestMapping("/list")
	public String stockList(StockDTO stockDTO, Model model,
			@RequestParam(value="page", defaultValue="1")
			int currentPage
			) {

		int listCount = stockService.selectStockCount(stockDTO);
		
		PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);

		List<StockDTO> stockList = stockService.selectStockList(stockDTO, pageInfo);

		int totalCount = stockService.selectStockTotalCount(stockDTO);
		int safeCount = stockService.selectStockSafeCount();
		int warningCount = stockService.selectStockWarningCount();
		int dangerCount = stockService.selectStockDangerCount();

		model.addAttribute("stockList", stockList);
		model.addAttribute("search", stockDTO);
		model.addAttribute("page", pageInfo);

		model.addAttribute("stockTotalCount", totalCount);
		model.addAttribute("safeCount", safeCount);
		model.addAttribute("warningCount", warningCount);
		model.addAttribute("dangerCount", dangerCount);
		System.out.println("stockStatusList = " + stockDTO.getStockStatusList());

		return "P08_stock/stockList.tiles";
	}
}