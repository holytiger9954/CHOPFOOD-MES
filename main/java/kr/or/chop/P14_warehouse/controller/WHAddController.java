package kr.or.chop.P14_warehouse.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P14_warehouse.service.WHService;

@Controller
@RequestMapping("/warehouse")
public class WHAddController {

	@Autowired
	WHService whService;
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add () {
		System.out.println("/warehouse/add controller.add");

		return "P14_warehouse/whAdd.tiles";
	}
	
	@PostMapping("/insert")
	public String insertWH(
	        WHDTO whDTO,
	        @RequestParam("whImgFile") MultipartFile whImgFile,
	        HttpServletRequest request
	) throws Exception {
		
		System.out.println("/workplace/add controller.add");
		System.out.println("이름 : " + whDTO.getWhName() + ", 유형 : " + whDTO.getWhTypeNo());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/P14_warehouse");
		String contextPath = request.getContextPath();

	    whService.insertWH(whDTO, whImgFile, uploadPath, contextPath);

	    return "redirect:/warehouse/list";
	}

}
