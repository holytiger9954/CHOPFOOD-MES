package kr.or.chop.P01_login.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chop.P01_login.dto.EmpDTO;
import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.P23_alarm.service.AlarmService;

@Controller
@RequestMapping("/mypage")
public class MyAlarmController {

	@Autowired
    private AlarmService alarmService;

    @RequestMapping("/alarm")
    public String myAlarm(HttpSession session, Model model) {

        EmpDTO loginUser = (EmpDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            model.addAttribute("alarmList", Collections.emptyList());
            return "P01_login/myAlarm.tiles";
        }

        List<AlarmDTO> alarmList = alarmService.selectMyAlarmList(
            loginUser.getEmpId(),
            loginUser.getEmpDeptno(),
            loginUser.getEmpAuth()
        );

        model.addAttribute("alarmList", alarmList);

        return "P01_login/myAlarm.tiles";
    }
	
}
