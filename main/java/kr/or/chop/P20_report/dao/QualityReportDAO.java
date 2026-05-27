package kr.or.chop.P20_report.dao;

import java.util.List;
import java.util.Map;

import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface QualityReportDAO {

    QualityReportSummaryDTO selectQualitySummary(QualityReportSearchDTO searchDTO);

    int selectQualityReportCount(QualityReportSearchDTO searchDTO);

    List<QualityReportListDTO> selectQualityReportList(
            QualityReportSearchDTO searchDTO,
            PageInfo pageInfo);

    List<ReportSelectDTO> selectItemList();

    List<ReportSelectDTO> selectEquipmentList();

    List<Map<String, Object>> selectDefectTrendList(QualityReportSearchDTO searchDTO);

    List<Map<String, Object>> selectRiskChartList(QualityReportSearchDTO searchDTO);
}