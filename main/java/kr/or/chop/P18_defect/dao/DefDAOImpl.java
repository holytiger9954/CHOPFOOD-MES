package kr.or.chop.P18_defect.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.common.pagination.PageInfo;

@Repository
public class DefDAOImpl implements DefDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<DefDTO> selectAllDef(DefDTO defDTO, PageInfo pageInfo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("defDTO", defDTO);
		paramMap.put("page", pageInfo);
		System.out.println(paramMap);
		
		return sqlSession.selectList("mapper.P18_defect.selectDefList", paramMap);
	}

	@Override
	public int selectDefCount(DefDTO defDTO) {

		return sqlSession.selectOne("mapper.P18_defect.selectDefCount", defDTO);
	}
	
}
