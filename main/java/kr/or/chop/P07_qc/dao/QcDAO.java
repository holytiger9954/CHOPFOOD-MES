package kr.or.chop.P07_qc.dao;

import java.util.List;

import kr.or.chop.P07_qc.dto.QcDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface QcDAO {

	int selectQcCount(QcDTO dto);
	List<QcDTO> selectQcList(QcDTO dto, PageInfo pageinfo);
	QcDTO selectQcSummary(QcDTO dto);
	QcDTO selectQcDetail(String qcId);
	int insertQc(QcDTO dto);
	int updateQc(QcDTO dto);
	int deleteQc(String qcId);
	
}
