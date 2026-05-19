package kr.or.chop.P14_warehouse.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P14_warehouse.dto.SecDTO;

@Repository
public class SecDAOImpl implements SecDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public SecDTO selectWhSecDTO(SecDTO secDTO) {
		return sqlSession.selectOne("mapper.P14_warehouse.section.selectWhSecDTO", secDTO);
	}

}
