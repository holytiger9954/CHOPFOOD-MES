package kr.or.chop.P17_vendor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P17_vendor.dto.VendorDTO;
import kr.or.chop.P17_vendor.service.VendorService;

@Controller
@RequestMapping("/vendor")
public class VendorAddController {

	@Autowired
    private VendorService vendorService;
	
	// 등록 페이지 이동
    @RequestMapping("/add")
    public String vendorAddForm() {
        return "P17_vendor/vendorAdd.tiles";
    }

    // 거래처 등록
    @PostMapping("/insert")
    public String insertVendor(
            @ModelAttribute VendorDTO vendorDTO) {

        vendorService.insertVendor(vendorDTO);

        return "redirect:/vendor/list";
    }
	
}
