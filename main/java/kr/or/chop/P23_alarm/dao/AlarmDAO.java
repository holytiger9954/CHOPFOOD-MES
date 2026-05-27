package kr.or.chop.P23_alarm.dao;

import java.util.List;
import java.util.Map;

import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface AlarmDAO {

	List<AlarmDTO> selectAlarmList(AlarmDTO dto, PageInfo pageInfo);
	
	public int selectAlarmCount(AlarmDTO dto);
	
	List<AlarmDTO> selectAlarmTypeList();

	AlarmDTO selectAlarmDetail(String alarmId);

	int insertAlarm(AlarmDTO dto);

	int deleteAlarm(String alarmId);

	List<AlarmDTO> selectMyAlarmList(Map<String, Object> map);

	List<Map<String, Object>> selectAlarmTargetList(Map<String, Object> map);
	
}
