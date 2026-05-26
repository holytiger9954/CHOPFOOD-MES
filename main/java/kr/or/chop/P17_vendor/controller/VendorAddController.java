package kr.or.chop.P17_vendor.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    		@RequestParam("venImgFile") MultipartFile venImgFile,
	        HttpServletRequest request,
            @ModelAttribute VendorDTO vendorDTO) throws IllegalStateException, IOException {
    	
    	String uploadPath = "D:/chop_upload/P17_vendor";
		String uploadUrl = "/upload/P17_vendor";
		
        vendorService.insertVendor(vendorDTO, venImgFile, uploadPath, uploadUrl);

        return "redirect:/vendor/list";
    }
	
}
