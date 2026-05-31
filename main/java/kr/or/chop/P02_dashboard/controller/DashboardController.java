package kr.or.chop.P02_dashboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P01_login.dto.EmpDTO;
import kr.or.chop.P01_login.service.MyService;
import kr.or.chop.P02_dashboard.service.DashboardService;
import kr.or.chop.P02_dashboard.service.RefreshService;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	@Autowired
	RefreshService refService;

	@Autowired
	DashboardService dashboardService;
	
	@Autowired
	MyService myService;

	@RequestMapping("")
	public String dashboard(Model model, HttpSession session) {

		refService.refreshStatus();
		
		EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");
		
		if (loginUser != null) {
			model.addAttribute("workList", myService.selectAllWork(loginUser));
		} else {
			model.addAttribute("workList", null);
		}


		model.addAttribute("warehouseTopList", dashboardService.selectWarehouseTopList());
		model.addAttribute("whStatusChart", dashboardService.selectWarehouseUsageSummary());
		model.addAttribute("whCount", dashboardService.selectWhCount());

		model.addAttribute("eqStatusSummary", dashboardService.selectEqStatusSummary());
		model.addAttribute("wpCount", dashboardService.selectWpCount());
		
//		model.addAttribute("todaySummary", dashboardService.selectTodaySummary());
//		model.addAttribute("weeklyWorkChart", dashboardService.selectWeeklyWorkChart());
//		model.addAttribute("weeklyDefectChart", dashboardService.selectWeeklyDefectChart());
		
//		model.addAttribute("todayWorkList", dashboardService.selectTodayWorkList());
		model.addAttribute("recentNoticeList", dashboardService.selectRecentNoticeList());
		model.addAttribute("recentSuggList", dashboardService.selectRecentSuggList());
		
		model.addAttribute("todaySummary", dashboardService.selectTodaySummary());
		model.addAttribute("todayProgressSummary", dashboardService.selectTodayProgressSummary());

		model.addAttribute("weeklyWorkChart", dashboardService.selectWeeklyWorkChart());
		model.addAttribute("weeklyDefectChart", dashboardService.selectWeeklyDefectChart());

		model.addAttribute("kpiList", dashboardService.selectKpiList());

		return "P02_dashboard/dashboard.tiles";
	}

}