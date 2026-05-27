package kr.or.chop.P20_report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;
import kr.or.chop.common.pagination.PageInfo;

@Repository
public class QualityReportDAOImpl implements QualityReportDAO {

    private static final String NAMESPACE = "mapper.P20_report.";

    @Autowired
    private SqlSession sqlSession;

    @Override
    public QualityReportSummaryDTO selectQualitySummary(QualityReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectQualitySummary", searchDTO);
    }

    @Override
    public int selectQualityReportCount(QualityReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectQualityReportCount", searchDTO);
    }

    @Override
    public List<QualityReportListDTO> selectQualityReportList(
            QualityReportSearchDTO searchDTO,
            PageInfo pageInfo) {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("search", searchDTO);
        paramMap.put("page", pageInfo);

        return sqlSession.selectList(NAMESPACE + "selectQualityReportList", paramMap);
    }

    @Override
    public List<ReportSelectDTO> selectItemList() {
        return sqlSession.selectList(NAMESPACE + "selectItemList");
    }

    @Override
    public List<ReportSelectDTO> selectEquipmentList() {
        return sqlSession.selectList(NAMESPACE + "selectEquipmentList");
    }

    @Override
    public List<Map<String, Object>> selectDefectTrendList(QualityReportSearchDTO searchDTO) {
        return sqlSession.selectList(NAMESPACE + "selectDefectTrendList", searchDTO);
    }

    @Override
    public List<Map<String, Object>> selectRiskChartList(QualityReportSearchDTO searchDTO) {
        return sqlSession.selectList(NAMESPACE + "selectRiskChartList", searchDTO);
    }
}