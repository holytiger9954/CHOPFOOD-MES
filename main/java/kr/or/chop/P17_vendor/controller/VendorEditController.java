package kr.or.chop.P17_vendor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P17_vendor.dto.VendorDTO;
import kr.or.chop.P17_vendor.service.VendorService;

@Controller
@RequestMapping("/vendor")
public class VendorEditController {

	@Autowired
	private VendorService vendorService;

	// 거래처 수정 페이지 이동
	@RequestMapping("/edit")
	public String edit(String vendorId, Model model) {

		VendorDTO vendor = vendorService.selectVendorDetail(vendorId);

		model.addAttribute("vendor", vendor);

		return "P17_vendor/vendorEdit.tiles";
	}

	// 거래처 수정 처리
	@RequestMapping("/update")
	public String update(VendorDTO vendorDTO) {

		vendorService.updateVendor(vendorDTO);

		return "redirect:/vendor/detail?vendorId=" + vendorDTO.getVendorId();
	}

	// 거래처 논리 삭제 처리
	@RequestMapping("/delete")
	public String delete(String vendorId) {

		vendorService.deleteVendor(vendorId);

		return "redirect:/vendor/list";
	}
}