package kr.or.chop.P07_qc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P07_qc.dao.QcDAO;
import kr.or.chop.P07_qc.dto.QcDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class QcServiceImpl implements QcService{

	@Autowired
	private QcDAO qcDAO;

	@Override
	public int selectQcCount(QcDTO dto) {
		return qcDAO.selectQcCount(dto);
	}

	@Override
	public List<QcDTO> selectQcList(QcDTO dto, PageInfo pageInfo) {
		return qcDAO.selectQcList(dto, pageInfo);
	}

	@Override
	public QcDTO selectQcSummary(QcDTO dto) {
		return qcDAO.selectQcSummary(dto);
	}

	@Override
	public QcDTO selectQcDetail(String qcId) {
		return qcDAO.selectQcDetail(qcId);
	}

	@Override
	public int insertQc(QcDTO dto) {
		return qcDAO.insertQc(dto);
	}

	@Override
	public int updateQc(QcDTO dto) {
		return qcDAO.updateQc(dto);
	}

	@Override
	public int deleteQc(String qcId) {
		return qcDAO.deleteQc(qcId);
	}

}
