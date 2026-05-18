package kr.or.chop.P16_equip.dao;

import java.util.List;

import kr.or.chop.P16_equip.dto.EqDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface EqDAO {

	List<EqDTO> selectEqList(EqDTO eqDTO, PageInfo pageInfo);

	int selectEqTotalCount();

	int selectEqCountByStatus(int eqStatus);
	
	EqDTO selectEqDetail(String eqId);

	List<EqDTO> selectEqLogList(String eqId);

	List<EqDTO> selectEqRunList(String eqId);

}
