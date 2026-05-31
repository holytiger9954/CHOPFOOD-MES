package kr.or.chop.P02_dashboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P02_dashboard.dao.DashboardDAO;
import kr.or.chop.P14_warehouse.dto.WHDTO;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	DashboardDAO dao;

	// 오늘 생산/완료/검사/불량 수량 조회
	@Override
	public Map<String, Object> selectTodaySummary() {
		return dao.selectTodaySummary();
	}

	// 설비 상태별 개수 및 가동률 조회
	@Override
	public Map<String, Object> selectEqStatusSummary() {
		return dao.selectEqStatusSummary();
	}

	// 적재율 높은 창고 TOP5 조회
	@Override
	public List<Map<String, Object>> selectWarehouseTopList() {
		return dao.selectWarehouseTopList();
	}
	
	@Override
	public Map<String, Object> selectWhCount() {
		return dao.selectWhCount();
	}
	
	// 창고 적재 상태 요약 조회
	@Override
	public WHDTO selectWarehouseUsageSummary() {
		return dao.selectWarehouseUsageSummary();
	}
	
	// 작업장 수
	@Override
	public int selectWpCount() {
		return dao.selectWpCount();
	}

	// 최근 7일 작업 수량 조회
	@Override
	public List<Map<String, Object>> selectWeeklyWorkChart() {
		return dao.selectWeeklyWorkChart();
	}

	// 최근 7일 불량률 조회
	@Override
	public List<Map<String, Object>> selectWeeklyDefectChart() {
		return dao.selectWeeklyDefectChart();
	}

	// 오늘 작업 예정인 작업지시 목록 조회
	@Override
	public List<Map<String, Object>> selectTodayWorkList() {
		return dao.selectTodayWorkList();
	}

	// KPI 지표 목록 조회
	@Override
	public List<Map<String, Object>> selectKpiList() {
		return dao.selectKpiList();
	}

	// 최근 공지사항 5개 조회
	@Override
	public List<Map<String, Object>> selectRecentNoticeList() {
		return dao.selectRecentNoticeList();
	}
	@Override
	public List<Map<String, Object>> selectRecentSuggList() {
		return dao.selectRecentSuggList();
	}
	
	// 오늘 작업, 품질검사 진행률
	@Override
	public Map<String, Object> selectTodayProgressSummary() {
		return dao.selectTodayProgressSummary();
	}

}