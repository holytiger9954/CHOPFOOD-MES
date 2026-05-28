package kr.or.chop.P02_dashboard.dao;

public interface RefreshDAO {
	
	public int updateWorkStatusAuto();
	public int updatePlanWpQty();
	public int updatePlanWpQtyOne(String planId);
	public int updatePlanStatusAuto();
	public int updateQcStatusAuto();

}
