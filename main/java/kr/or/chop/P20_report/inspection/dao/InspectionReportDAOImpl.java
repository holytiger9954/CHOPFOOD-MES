package kr.or.chop.P20_report.inspection.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P20_report.inspection.dto.InspectionReportListDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSearchDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSummaryDTO;
import kr.or.chop.common.ai.dto.InspectionAiPredictRequestDTO;
import kr.or.chop.common.pagination.PageInfo;

@Repository
public class InspectionReportDAOImpl implements InspectionReportDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE =
            "mapper.P20_report.inspection.inspection_report_mapper.";

    @Override
    public InspectionReportSummaryDTO selectInspectionSummary(InspectionReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectInspectionSummary", searchDTO);
    }

    @Override
    public List<Map<String, Object>> selectInspectionRiskChartList(InspectionReportSearchDTO searchDTO) {
        return sqlSession.selectList(NAMESPACE + "selectInspectionRiskChartList", searchDTO);
    }

    @Override
    public List<Map<String, Object>> selectInspectionTrendList(InspectionReportSearchDTO searchDTO) {
        return sqlSession.selectList(NAMESPACE + "selectInspectionTrendList", searchDTO);
    }

    @Override
    public int selectInspectionReportCount(InspectionReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectInspectionReportCount", searchDTO);
    }

    @Override
    public List<InspectionReportListDTO> selectInspectionReportList(
            InspectionReportSearchDTO searchDTO,
            PageInfo pageInfo) {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("search", searchDTO);
        paramMap.put("page", pageInfo);

        return sqlSession.selectList(NAMESPACE + "selectInspectionReportList", paramMap);
    }
    
    @Override
    public InspectionAiPredictRequestDTO selectInspectionAiTarget(InspectionReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectInspectionAiTarget", searchDTO);
    }
}