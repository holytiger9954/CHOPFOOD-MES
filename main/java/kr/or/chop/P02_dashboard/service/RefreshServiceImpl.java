package kr.or.chop.P02_dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.chop.P02_dashboard.dao.RefreshDAO;

@Service
public class RefreshServiceImpl implements RefreshService{
	
	@Autowired
	RefreshDAO dao;
	
	@Override
	@Transactional
	public void refreshStatus() {
		dao.updateWorkStatusAuto();
		dao.updatePlanWpQty();
		dao.updatePlanStatusAuto();
	}

}
