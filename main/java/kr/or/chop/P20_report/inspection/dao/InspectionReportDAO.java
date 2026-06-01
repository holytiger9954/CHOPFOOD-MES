package kr.or.chop.P20_report.inspection.dao;

import java.util.List;
import java.util.Map;

import kr.or.chop.P20_report.inspection.dto.InspectionReportListDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSearchDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSummaryDTO;
import kr.or.chop.common.ai.dto.InspectionAiPredictRequestDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface InspectionReportDAO {

    InspectionReportSummaryDTO selectInspectionSummary(InspectionReportSearchDTO searchDTO);

    List<Map<String, Object>> selectInspectionRiskChartList(InspectionReportSearchDTO searchDTO);

    List<Map<String, Object>> selectInspectionTrendList(InspectionReportSearchDTO searchDTO);

    int selectInspectionReportCount(InspectionReportSearchDTO searchDTO);

    List<InspectionReportListDTO> selectInspectionReportList(InspectionReportSearchDTO searchDTO, PageInfo pageInfo);
    
    InspectionAiPredictRequestDTO selectInspectionAiTarget(InspectionReportSearchDTO searchDTO);
}