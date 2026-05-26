package kr.or.chop.P01_login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P01_login.dto.EmpDTO;
import kr.or.chop.P01_login.dto.UserWorkDTO;
import kr.or.chop.P01_login.service.MyService;
import kr.or.chop.P04_sugg.dto.SuggDTO;
import kr.or.chop.P14_warehouse.dto.WHDTO;

@Controller
@RequestMapping("/mypage")
public class MyController {

	@Autowired
	MyService myService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("")
	public String mypage(
			Model model
		) {
		EmpDTO loginUser = (EmpDTO)session.getAttribute("loginUser");
		
		List<UserWorkDTO> workList = myService.selectAllWork(loginUser); 
		List<SuggDTO> suggList = myService.selectAllSugg(loginUser);
		
		model.addAttribute("user", loginUser);
		model.addAttribute("workList", workList);
		model.addAttribute("suggList", suggList);
		
		return "P01_login/mypage.tiles";
	}
	
	@RequestMapping("/edit")
	public String myEdit(
			Model model
			) {
		EmpDTO loginUser = (EmpDTO)session.getAttribute("loginUser");
		
		List<UserWorkDTO> workList = myService.selectAllWork(loginUser); 
		List<SuggDTO> suggList = myService.selectAllSugg(loginUser);
		
		model.addAttribute("user", loginUser);
		
		return "P01_login/myEdit.tiles";
	}
	

	@PostMapping("/update")
	public String update (
			EmpDTO empDTO,
			@RequestParam("empImgFile") MultipartFile empImgFile,
	        HttpServletRequest request,
	        HttpSession session
			) throws Exception {
		String uploadPath = "D:/chop_upload/P02_login/user_profile";
		String uploadUrl = "/upload/P02_login/user_profile";
	    
	    myService.updateUser(empDTO, empImgFile, uploadPath, uploadUrl);
		
	    EmpDTO loginUser = myService.reSelectUserInfo(empDTO);
	    
	    session.setAttribute("loginUser", loginUser);
	    
		return "redirect:/mypage?empId=" + empDTO.getEmpId();
	}
	
}
