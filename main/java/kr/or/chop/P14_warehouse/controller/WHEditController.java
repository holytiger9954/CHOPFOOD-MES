package kr.or.chop.P14_warehouse.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P14_warehouse.service.WHService;
import kr.or.chop.P15_workplace.dto.WPDTO;

@Controller
@RequestMapping("/warehouse")
public class WHEditController {
	
	@Autowired
	WHService whService;
	

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String add (
			Model model,
			WHDTO whDTO,
			@RequestParam String whId
			) {
		System.out.println("/warehouse/edit controller.edit");
		
		whDTO.setWhId(whId);
		whDTO = whService.selectWhDTO(whDTO);
		
		model.addAttribute("whDTO", whDTO);

		return "P14_warehouse/whEdit.tiles";
	}
	
	@PostMapping("/update")
	public String update (
			WHDTO whDTO,
			@RequestParam("whImgFile") MultipartFile whImgFile,
	        HttpServletRequest request
			) throws Exception {
		
		System.out.println("/warehouse/edit controller.update");
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/P14_warehouse");
	    String contextPath = request.getContextPath();
	    
	    whService.updateWH(whDTO, whImgFile, uploadPath, contextPath);
		
		return "redirect:/warehouse/detail?whId=" + whDTO.getWhId();
	}
	
}
