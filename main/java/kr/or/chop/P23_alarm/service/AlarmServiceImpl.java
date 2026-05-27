package kr.or.chop.P23_alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P23_alarm.dao.AlarmDAO;
import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmDAO alarmDAO;

	@Override
	public List<AlarmDTO> selectAlarmList(AlarmDTO dto, PageInfo pageInfo) {
		return alarmDAO.selectAlarmList(dto, pageInfo);
	}
	
	@Override
	public List<AlarmDTO> selectAlarmTypeList() {
		return alarmDAO.selectAlarmTypeList();
	}
	
	@Override
	public int selectAlarmCount(AlarmDTO dto) {
		return alarmDAO.selectAlarmCount(dto);
	}

	@Override
	public AlarmDTO selectAlarmDetail(String alarmId) {
		return alarmDAO.selectAlarmDetail(alarmId);
	}

	@Override
	public int insertAlarm(AlarmDTO dto) {
		setTarget(dto);
		return alarmDAO.insertAlarm(dto);
	}

	@Override
	public int deleteAlarm(String alarmId) {
		return alarmDAO.deleteAlarm(alarmId);
	}

	@Override
	public List<AlarmDTO> selectMyAlarmList(String empId, Integer deptNo, Integer authNo) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("empId", empId);
		map.put("deptNo", deptNo);
		map.put("authNo", authNo);

		return alarmDAO.selectMyAlarmList(map);
	}

	@Override
	public List<Map<String, Object>> selectAlarmTargetList(String targetType, String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("targetType", targetType);
		map.put("keyword", keyword);

		return alarmDAO.selectAlarmTargetList(map);
	}

	private void setTarget(AlarmDTO dto) {

		if ("EMP".equals(dto.getTargetType())) {
			dto.setAlarmDept(null);
			dto.setAlarmAuth(null);
		}

		else if ("DEPT".equals(dto.getTargetType())) {
			dto.setAlarmEmp(null);
			dto.setAlarmAuth(null);
		}

		else if ("AUTH".equals(dto.getTargetType())) {
			dto.setAlarmEmp(null);
			dto.setAlarmDept(null);
		}

		else {
			dto.setAlarmEmp(null);
			dto.setAlarmDept(null);
			dto.setAlarmAuth(null);
		}
	}
	
}
