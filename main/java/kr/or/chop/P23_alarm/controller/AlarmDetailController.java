package kr.or.chop.P23_alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.P23_alarm.service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmDetailController {

	@Autowired
	private AlarmService alarmService;

	@RequestMapping("/detail")
	public String detail(String alarmId, Model model) {

		AlarmDTO alarm = alarmService.selectAlarmDetail(alarmId);

		model.addAttribute("alarm", alarm);

		return "P23_alarm/alarmDetail.tiles";
	}

	@RequestMapping("/delete")
	public String delete(String alarmId) {

		alarmService.deleteAlarm(alarmId);

		return "redirect:/alarm/list";
	}
	
}
