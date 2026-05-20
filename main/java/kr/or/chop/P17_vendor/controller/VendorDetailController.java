package kr.or.chop.P17_vendor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P17_vendor.dto.VendorDTO;
import kr.or.chop.P17_vendor.service.VendorService;

@Controller
@RequestMapping("/vendor")
public class VendorDetailController {

    @Autowired
    private VendorService vendorService;

    @RequestMapping("/detail")
    public String vendorDetail(
            @RequestParam("vendorId") String vendorId,
            Model model) {

        VendorDTO vendor = vendorService.selectVendorDetail(vendorId);

        model.addAttribute("vendor", vendor);

        return "P17_vendor/vendorDetail.tiles";
    }
}