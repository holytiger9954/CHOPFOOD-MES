package kr.or.chop.P20_report.service;

import java.util.List;

import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;

public interface QualityReportService {

    QualityReportSummaryDTO selectQualitySummary(QualityReportSearchDTO searchDTO);
    
    List<QualityReportListDTO> selectQualityReportList(QualityReportSearchDTO searchDTO);
    
    List<ReportSelectDTO> selectItemList();

    List<ReportSelectDTO> selectDefectTypeList();
}