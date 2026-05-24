package kr.or.chop.P02_dashboard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefreshDAOImpl implements RefreshDAO {
	
	@Autowired
	SqlSession session;

	@Override
	public int updateWorkStatusAuto() {
		return session.update("mapper.P02_dashboard.updateWorkStatusAuto");
	}

	@Override
	public int updatePlanWpQty() {
		return session.update("mapper.P02_dashboard.updatePlanWpQty");
	}

	@Override
	public int updatePlanStatusAuto() {
		return session.update("mapper.P02_dashboard.updatePlanStatusAuto");
	}
	
	
	
}
