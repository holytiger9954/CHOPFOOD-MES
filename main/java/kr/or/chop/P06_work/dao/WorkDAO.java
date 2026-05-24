package kr.or.chop.P06_work.dao;

import java.util.List;

import kr.or.chop.P05_plan.dto.PlanDTO;
import kr.or.chop.P06_work.dto.WorkDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface WorkDAO {
	
	public int selectWorkCount(WorkDTO workDTO);
	public List<WorkDTO> selectAllWork(WorkDTO workDTO, PageInfo pageInfo);
	public WorkDTO selectWorkCardCnt(WorkDTO workDTO);
	
	public WorkDTO selectWorkDetail(WorkDTO workDTO);
	public List<WorkDTO> selectWorkProcList(WorkDTO workDTO);
	
	public List<PlanDTO> selectWorkPlanList();
	public List<WorkDTO> selectWorkerList(WorkDTO workDTO);
	public int insertWork(WorkDTO workDTO);

}
