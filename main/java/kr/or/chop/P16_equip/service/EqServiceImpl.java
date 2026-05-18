package kr.or.chop.P16_equip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P15_workplace.dto.WPDTO;
import kr.or.chop.P16_equip.dao.EqDAO;
import kr.or.chop.P16_equip.dto.EqDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class EqServiceImpl implements EqService {

	@Autowired
	EqDAO eqDAO;

	@Override
	public List<EqDTO> selectEqList(EqDTO eqDTO, PageInfo pageInfo) {
		return eqDAO.selectEqList(eqDTO, pageInfo);
	}

	@Override
	public int selectEqTotalCount() {
		return eqDAO.selectEqTotalCount();
	}

	@Override
	public int selectEqCountByStatus(int eqStatus) {
		return eqDAO.selectEqCountByStatus(eqStatus);
	}

	@Override
	public EqDTO selectEqDetail(String eqId) {
	    return eqDAO.selectEqDetail(eqId);
	}

	@Override
	public List<EqDTO> selectEqLogList(String eqId) {
	    return eqDAO.selectEqLogList(eqId);
	}

	@Override
	public List<EqDTO> selectEqRunList(String eqId) {
	    return eqDAO.selectEqRunList(eqId);
	}
	
	@Override
	public void insertEq(EqDTO eqDTO) {
	    eqDAO.insertEq(eqDTO);
	}
	
	@Override
	public List<WPDTO> selectWpList() {
	    return eqDAO.selectWpList();
	}
	
}
