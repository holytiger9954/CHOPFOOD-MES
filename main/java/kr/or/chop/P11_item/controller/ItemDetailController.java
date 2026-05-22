package kr.or.chop.P11_item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P09_lot.dto.LotDTO;
import kr.or.chop.P11_item.dto.ItemDTO;
import kr.or.chop.P11_item.service.ItemService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/item")
public class ItemDetailController {

	@Autowired
	ItemService itemService;

	@RequestMapping("/detail")
	public String detail(Model model, 
			LotDTO lotDTO, 
			ItemDTO itemDTO,
			@RequestParam(value="page", defaultValue="1")
			int currentPage
			) {

		int listCount = itemService.selectLotCount(itemDTO.getItemId());
		
		PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);
		
		ItemDTO item = itemService.selectItemDetail(itemDTO);
		
		List<LotDTO> lotList = itemService.selectLotListByItem(itemDTO.getItemId(), pageInfo);

		model.addAttribute("itemDTO", item);
		model.addAttribute("lotList", lotList);
		model.addAttribute("page", pageInfo);

		return "P11_item/itemDetail.tiles";
	}
	
	@RequestMapping("/delete")
	public String deleteItem(String itemId) {

		itemService.deleteItem(itemId);

		return "redirect:/item/list";
	}

}
