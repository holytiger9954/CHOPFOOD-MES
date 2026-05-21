package kr.or.chop.P13_bom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P13_bom.dto.BOMDTO;
import kr.or.chop.P13_bom.dto.BOMDetailDTO;
import kr.or.chop.P13_bom.service.BOMService;

@Controller
@RequestMapping("/bom")
public class BOMEditController {

	@Autowired
	BOMService bomService;

	@RequestMapping("/edit")
	public String bomEdit(String bomId, Model model) {

		BOMDTO bom = bomService.selectBomDetail(bomId);

		List<BOMDetailDTO> detailList = bomService.selectBomDetailList(bomId);

		List<BOMDTO> finishItemList = bomService.selectFinishItemList();

		List<BOMDTO> materialItemList = bomService.selectMaterialItemList();

		model.addAttribute("bom", bom);
		model.addAttribute("detailList", detailList);
		model.addAttribute("finishItemList", finishItemList);
		model.addAttribute("materialItemList", materialItemList);

		return "P13_bom/bomEdit.tiles";
	}

	@RequestMapping("/update")
	public String bomUpdate(BOMDTO bomDTO, BOMDetailDTO detailDTO) {

		bomService.updateBom(bomDTO);

		bomService.deleteBomDetailByBomId(bomDTO.getBomId());

		String[] itemList = detailDTO.getBomDtlItemList();
		int[] qtyList = detailDTO.getBomDtlQtyList();

		if (itemList != null && qtyList != null) {
			for (int i = 0; i < itemList.length; i++) {

				if (itemList[i] == null || itemList[i].trim().equals("")) {
					continue;
				}

				if (qtyList[i] <= 0) {
					continue;
				}

				BOMDetailDTO dto = new BOMDetailDTO();

				dto.setBomDtlBom(bomDTO.getBomId());
				dto.setBomDtlItem(itemList[i]);
				dto.setBomDtlQty(qtyList[i]);

				bomService.insertBomDetail(dto);
			}
		}

		return "redirect:/bom/detail?bomId=" + bomDTO.getBomId();
	}

	@RequestMapping("/delete")
	public String bomDelete(String bomId) {

		bomService.deleteBom(bomId);
		bomService.deleteBomDetailByBomId(bomId);

		return "redirect:/bom/list";
	}
}