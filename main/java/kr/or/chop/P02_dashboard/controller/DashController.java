package kr.or.chop.P02_dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P02_dashboard.service.RefreshService;

@Controller
@RequestMapping("/dashboard")
public class DashController {

	@Autowired
	RefreshService refService;
	
	@RequestMapping("")
	public String dashboard(Model model) {
		refService.refreshStatus();
		return "P02_dashboard/dashboard.tiles";
	}
	
}
