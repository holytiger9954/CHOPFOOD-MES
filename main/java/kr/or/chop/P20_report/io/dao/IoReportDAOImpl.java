package kr.or.chop.P20_report.io.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P20_report.io.dto.IoReportListDTO;
import kr.or.chop.P20_report.io.dto.IoReportSearchDTO;
import kr.or.chop.P20_report.io.dto.IoReportSummaryDTO;
import kr.or.chop.common.ai.dto.IoAiPredictRequestDTO;
import kr.or.chop.common.pagination.PageInfo;

@Repository
public class IoReportDAOImpl implements IoReportDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE =
            "mapper.P20_report.io.io_report_mapper.";

    @Override
    public IoReportSummaryDTO selectIoSummary(IoReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectIoSummary", searchDTO);
    }

    @Override
    public List<Map<String, Object>> selectIoRiskChartList(IoReportSearchDTO searchDTO) {
        return sqlSession.selectList(NAMESPACE + "selectIoRiskChartList", searchDTO);
    }

    @Override
    public List<Map<String, Object>> selectIoTrendList(IoReportSearchDTO searchDTO) {
        return sqlSession.selectList(NAMESPACE + "selectIoTrendList", searchDTO);
    }

    @Override
    public int selectIoReportCount(IoReportSearchDTO searchDTO) {
        return sqlSession.selectOne(NAMESPACE + "selectIoReportCount", searchDTO);
    }

    @Override
    public List<IoReportListDTO> selectIoReportList(
            IoReportSearchDTO searchDTO,
            PageInfo pageInfo) {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("search", searchDTO);
        paramMap.put("page", pageInfo);

        return sqlSession.selectList(NAMESPACE + "selectIoReportList", paramMap);
    }
    
    @Override
    public IoAiPredictRequestDTO selectIoAiTarget(
            IoReportSearchDTO searchDTO) {

        return sqlSession.selectOne(
                NAMESPACE + "selectIoAiTarget",
                searchDTO);
    }
}