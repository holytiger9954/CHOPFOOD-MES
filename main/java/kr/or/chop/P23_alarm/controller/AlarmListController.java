package kr.or.chop.P23_alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.P23_alarm.service.AlarmService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/alarm")
public class AlarmListController {

	@Autowired
	private AlarmService alarmService;

	@RequestMapping("/list")
	public String list(AlarmDTO alarmDTO, Model model,
    		@RequestParam(value="page", defaultValue="1")
    		int currentPage
    		) {

		int listCount = alarmService.selectAlarmCount(alarmDTO);
		
		PageInfo pageInfo = Pagination.getPageInfo(
				listCount, 
				currentPage, 
				5, 
				10);
		
		List<AlarmDTO> alarmList = alarmService.selectAlarmList(alarmDTO, pageInfo);

		model.addAttribute("alarmList", alarmList);
		model.addAttribute("search", alarmDTO);
		model.addAttribute("page", pageInfo);

		return "P23_alarm/alarmList.tiles";
	}
	
}
