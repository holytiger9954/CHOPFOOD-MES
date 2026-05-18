package kr.or.chop.P16_equip.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P16_equip.dto.EqDTO;
import kr.or.chop.common.pagination.PageInfo;

@Repository
public class EqDAOImpl implements EqDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<EqDTO> selectEqList(EqDTO eqDTO, PageInfo pageInfo) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("eqWpid", eqDTO.getEqWpid());
		paramMap.put("eqStatus", eqDTO.getEqStatus());
		paramMap.put("searchKeyword", eqDTO.getSearchKeyword());
		paramMap.put("page", pageInfo);

		return sqlSession.selectList("mapper.P16_equipment.selectEqList", paramMap);
	}

	@Override
	public int selectEqTotalCount() {
		return sqlSession.selectOne("mapper.P16_equipment.selectEqTotalCount");
	}

	@Override
	public int selectEqCountByStatus(int eqStatus) {
		return sqlSession.selectOne("mapper.P16_equipment.selectEqCountByStatus", eqStatus);
	}
	
	@Override
	public EqDTO selectEqDetail(String eqId) {
	    return sqlSession.selectOne(
	        "mapper.P16_equipment.selectEqDetail",
	        eqId
	    );
	}

	@Override
	public List<EqDTO> selectEqLogList(String eqId) {
	    return sqlSession.selectList(
	        "mapper.P16_equipment.selectEqLogList",
	        eqId
	    );
	}

	@Override
	public List<EqDTO> selectEqRunList(String eqId) {
	    return sqlSession.selectList(
	        "mapper.P16_equipment.selectEqRunList",
	        eqId
	    );
	}

}
