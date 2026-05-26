package kr.or.chop.P20_report.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;

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
	public List<QualityReportListDTO> selectQualityReportList(QualityReportSearchDTO searchDTO) {
		return sqlSession.selectList(NAMESPACE + "selectQualityReportList", searchDTO);
	}

	@Override
	public List<ReportSelectDTO> selectItemList() {

		return sqlSession.selectList(NAMESPACE + "selectItemList");
	}

	@Override
	public List<ReportSelectDTO> selectDefectTypeList() {

		return sqlSession.selectList(NAMESPACE + "selectDefectTypeList");
	}
}