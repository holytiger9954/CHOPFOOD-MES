package kr.or.chop.P23_alarm.service;

import java.util.List;
import java.util.Map;

import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface AlarmService {
	
	List<AlarmDTO> selectAlarmList(AlarmDTO dto, PageInfo pageInfo);
	
	int selectAlarmCount(AlarmDTO dto);
	
	List<AlarmDTO> selectAlarmTypeList();

	AlarmDTO selectAlarmDetail(String alarmId);

	int insertAlarm(AlarmDTO dto);

	int deleteAlarm(String alarmId);

	List<AlarmDTO> selectMyAlarmList(String empId, Integer deptNo, Integer authNo);

	List<Map<String, Object>> selectAlarmTargetList(String targetType, String keyword);
}
