package kr.or.chop.P23_alarm.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.chop.P01_login.dto.EmpDTO;
import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.P23_alarm.service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmJsonController {

	@Autowired
	private AlarmService alarmService;

	@RequestMapping("/myListJson")
	@ResponseBody
	public List<AlarmDTO> myListJson(HttpSession session) {

		EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return Collections.emptyList();
		}

		// 아래 getter 이름은 네 AdminDTO에 맞게 바꿔야 함
		String empId = loginUser.getEmpId();
		Integer deptNo = loginUser.getEmpDeptno();
		Integer authNo = loginUser.getEmpAuth();

		return alarmService.selectMyAlarmList(empId, deptNo, authNo);
	}
	
}
