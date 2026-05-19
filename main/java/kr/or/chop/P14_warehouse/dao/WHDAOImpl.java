package kr.or.chop.P14_warehouse.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;
import kr.or.chop.common.pagination.PageInfo;


@Repository
public class WHDAOImpl implements WHDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int selectWHCount(WHDTO whDTO) {

		System.out.println("/warehouse/list dao.selectWHCount");
		System.out.println("WHDTO : " + whDTO);
		
		return sqlSession.selectOne("mapper.P14_warehouse.selectWHCount", whDTO);
	}
	
	@Override
	public WHDTO selectWhCardCnt(WHDTO whDTO) {
		System.out.println("/warehouse/list dao.selectWhCardCnt");
		
	    return sqlSession.selectOne("mapper.P14_warehouse.selectWhCardCnt", whDTO);
	}
	
	@Override
	public List<WHDTO> selectAllWH(WHDTO whDTO, PageInfo pageInfo) {
		System.out.println("/warehouse/list dao.selectAllWH");
		
	    Map map = new HashMap();
	    map.put("whDTO", whDTO);
	    map.put("page", pageInfo);

	    return sqlSession.selectList("mapper.P14_warehouse.selectAllWH", map);
	}

	@Override
	public WHDTO selectWHDTO(WHDTO whDTO) {
		System.out.println("/warehouse/detail dao.selectWHDTO");
		
		return sqlSession.selectOne("mapper.P14_warehouse.selectWHDTO", whDTO);
	}

	@Override
	public int selectGlogCount(WHDTO whDTO) {
		System.out.println("/warehouse/detail dao.selectGlogCount");

		return sqlSession.selectOne("mapper.P14_warehouse.selectGlogCount", whDTO);
	}

	@Override
	public List<GlogDTO> selectGlogList(WHDTO whDTO) {
		System.out.println("/warehouse/detail dao.selectGlogList");

		return sqlSession.selectList("mapper.P14_warehouse.selectGlogList", whDTO);
	}
	


}
