package kr.or.chop.P14_warehouse.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P14_warehouse.dto.SecDTO;
import kr.or.chop.P14_warehouse.service.SecService;

@Controller
@RequestMapping("/warehouse/section")
public class SecAddController {


	@Autowired
	SecService secService;
	

	@RequestMapping("/add")
	public String add (
			Model model,
			@RequestParam(value="whId") String whId
		) {
		model.addAttribute("whId", whId);
		return "P14_warehouse/secAdd.tiles";
	}
	
	@RequestMapping("/insert")
	public String insert (
			SecDTO secDTO,
			@RequestParam("secImgFile") MultipartFile secImgFile,
	        HttpServletRequest request
		) throws IllegalStateException, IOException {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/P14_warehouse/section");
		String contextPath = request.getContextPath();
		
		secService.insertSection(secDTO, secImgFile, uploadPath, contextPath);
		return "redirect:/warehouse/detail?whId=" + secDTO.getSecWhId();
	}
	
	@RequestMapping("/edit")
	public String edit (
			Model model,
			SecDTO secDTO,
			@RequestParam(value="secId") String secId
		) {
		
		secDTO.setSecId(secId);
		secDTO = secService.selectSecDTO(secDTO);
		
		model.addAttribute("secDTO", secDTO);
		
		return "P14_warehouse/secEdit.tiles";
	}
}
