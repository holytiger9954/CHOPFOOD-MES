package kr.or.chop.P11_item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P11_item.dto.ItemDTO;
import kr.or.chop.P11_item.service.ItemService;
import kr.or.chop.P17_vendor.dto.VendorDTO;

@Controller
@RequestMapping("/item")
public class ItemEditController {

	@Autowired
	ItemService itemService;

	@RequestMapping("/edit")
	public String editForm(ItemDTO itemDTO, Model model) {

		ItemDTO item = itemService.selectItemDetail(itemDTO);


		model.addAttribute("itemDTO", item);


		return "P11_item/itemEdit.tiles";
	}


	@RequestMapping("/update")
	public String updateItem(ItemDTO itemDTO) {

		itemService.updateItem(itemDTO);

		return "redirect:/item/detail?itemId=" + itemDTO.getItemId();
	}
	
}
