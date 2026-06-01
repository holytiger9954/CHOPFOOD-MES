package kr.or.chop.P20_report.inspection.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P20_report.inspection.dao.InspectionReportDAO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportListDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSearchDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSummaryDTO;
import kr.or.chop.common.ai.dto.InspectionAiPredictRequestDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class InspectionReportServiceImpl implements InspectionReportService {

	@Autowired
	private InspectionReportDAO inspectionReportDAO;

	@Override
	public InspectionReportSummaryDTO selectInspectionSummary(InspectionReportSearchDTO searchDTO) {

		return inspectionReportDAO.selectInspectionSummary(searchDTO);
	}

	@Override
	public List<Map<String, Object>> selectInspectionRiskChartList(InspectionReportSearchDTO searchDTO) {

		return inspectionReportDAO.selectInspectionRiskChartList(searchDTO);
	}

	@Override
	public List<Map<String, Object>> selectInspectionTrendList(InspectionReportSearchDTO searchDTO) {

		return inspectionReportDAO.selectInspectionTrendList(searchDTO);
	}

	@Override
	public int selectInspectionReportCount(InspectionReportSearchDTO searchDTO) {

		return inspectionReportDAO.selectInspectionReportCount(searchDTO);
	}

	@Override
	public List<InspectionReportListDTO> selectInspectionReportList(InspectionReportSearchDTO searchDTO,
			PageInfo pageInfo) {

		return inspectionReportDAO.selectInspectionReportList(searchDTO, pageInfo);
	}

	@Override
	public InspectionAiPredictRequestDTO selectInspectionAiTarget(InspectionReportSearchDTO searchDTO) {
		return inspectionReportDAO.selectInspectionAiTarget(searchDTO);
	}
}