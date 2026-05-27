package kr.or.chop.P23_alarm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.P23_alarm.service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmAddController {

	@Autowired
	private AlarmService alarmService;

	@RequestMapping("/add")
	public String addForm(Model model) {
		
		List<AlarmDTO> alarmTypeList = alarmService.selectAlarmTypeList();

		model.addAttribute("alarmTypeList", alarmTypeList);
		
		return "P23_alarm/alarmAdd.tiles";
	}

	@RequestMapping("/insertDo")
	public String insertDo(AlarmDTO alarmDTO) {

		int result = alarmService.insertAlarm(alarmDTO);

		if (result > 0) {
			return "redirect:/alarm/add?result=success";
		}

		return "redirect:/alarm/add?result=fail";
	}

	@ResponseBody
	@RequestMapping("/targetList")
	public List<Map<String, Object>> targetList(String targetType, String keyword) {

		return alarmService.selectAlarmTargetList(targetType, keyword);
	}
	
}
