package kr.or.chop.P23_alarm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P23_alarm.dto.AlarmDTO;
import kr.or.chop.common.pagination.PageInfo;

@Repository	
public class AlarmDAOImpl implements AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private final String namespace = "kr.or.chop.P23_alarm.";

	@Override
	public List<AlarmDTO> selectAlarmList(AlarmDTO dto, PageInfo pageInfo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchKeyword", dto.getSearchKeyword());
		paramMap.put("page", pageInfo);
		
		return sqlSession.selectList(namespace + "selectAlarmList", paramMap);
	}
	
	@Override
	public List<AlarmDTO> selectAlarmTypeList() {
		return sqlSession.selectList(namespace + "selectAlarmTypeList");
	}
	
	@Override
	public int selectAlarmCount(AlarmDTO dto) {
		return sqlSession.selectOne(namespace + "selectAlarmCount", dto);
	}

	@Override
	public AlarmDTO selectAlarmDetail(String alarmId) {
		return sqlSession.selectOne(namespace + "selectAlarmDetail", alarmId);
	}

	@Override
	public int insertAlarm(AlarmDTO dto) {
		return sqlSession.insert(namespace + "insertAlarm", dto);
	}

	@Override
	public int deleteAlarm(String alarmId) {
		return sqlSession.update(namespace + "deleteAlarm", alarmId);
	}

	@Override
	public List<AlarmDTO> selectMyAlarmList(Map<String, Object> map) {
		return sqlSession.selectList(namespace + "selectMyAlarmList", map);
	}

	@Override
	public List<Map<String, Object>> selectAlarmTargetList(Map<String, Object> map) {
		return sqlSession.selectList(namespace + "selectAlarmTargetList", map);
	}
	
}
