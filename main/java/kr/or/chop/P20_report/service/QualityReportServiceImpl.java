package kr.or.chop.P20_report.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P20_report.dao.QualityReportDAO;
import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class QualityReportServiceImpl implements QualityReportService {

    @Autowired
    private QualityReportDAO qualityReportDAO;

    @Override
    public QualityReportSummaryDTO selectQualitySummary(QualityReportSearchDTO searchDTO) {
        return qualityReportDAO.selectQualitySummary(searchDTO);
    }

    @Override
    public int selectQualityReportCount(QualityReportSearchDTO searchDTO) {
        return qualityReportDAO.selectQualityReportCount(searchDTO);
    }

    @Override
    public List<QualityReportListDTO> selectQualityReportList(
            QualityReportSearchDTO searchDTO,
            PageInfo pageInfo) {
        return qualityReportDAO.selectQualityReportList(searchDTO, pageInfo);
    }

    @Override
    public List<ReportSelectDTO> selectItemList() {
        return qualityReportDAO.selectItemList();
    }

    @Override
    public List<ReportSelectDTO> selectEquipmentList() {
        return qualityReportDAO.selectEquipmentList();
    }

    @Override
    public List<Map<String, Object>> selectDefectTrendList(QualityReportSearchDTO searchDTO) {
        return qualityReportDAO.selectDefectTrendList(searchDTO);
    }

    @Override
    public List<Map<String, Object>> selectRiskChartList(QualityReportSearchDTO searchDTO) {
        return qualityReportDAO.selectRiskChartList(searchDTO);
    }
}