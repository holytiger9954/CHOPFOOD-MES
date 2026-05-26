package kr.or.chop.P20_report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P20_report.dao.QualityReportDAO;
import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;

@Service
public class QualityReportServiceImpl implements QualityReportService {

    @Autowired
    private QualityReportDAO qualityReportDAO;

    @Override
    public QualityReportSummaryDTO selectQualitySummary(QualityReportSearchDTO searchDTO) {
        return qualityReportDAO.selectQualitySummary(searchDTO);
    }
    
    @Override
    public List<QualityReportListDTO> selectQualityReportList(QualityReportSearchDTO searchDTO) {
        return qualityReportDAO.selectQualityReportList(searchDTO);
    }
    
    @Override
    public List<ReportSelectDTO> selectItemList() {
        return qualityReportDAO.selectItemList();
    }

    @Override
    public List<ReportSelectDTO> selectDefectTypeList() {
        return qualityReportDAO.selectDefectTypeList();
    }
}