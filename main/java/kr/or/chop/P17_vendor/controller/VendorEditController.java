package kr.or.chop.P17_vendor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String update(
			VendorDTO vendorDTO,
			@RequestParam("venImgFile") MultipartFile venImgFile,
	        HttpServletRequest request
		) throws Exception {
		String uploadPath = "D:/chop_upload/P17_vendor";
		String uploadUrl = "/upload/P17_vendor";
		
		vendorService.updateVendor(vendorDTO, venImgFile, uploadPath, uploadUrl);

		return "redirect:/vendor/detail?vendorId=" + vendorDTO.getVendorId();
	}

	// 거래처 논리 삭제 처리
	@RequestMapping("/delete")
	public String delete(String vendorId) {

		vendorService.deleteVendor(vendorId);

		return "redirect:/vendor/list";
	}
}