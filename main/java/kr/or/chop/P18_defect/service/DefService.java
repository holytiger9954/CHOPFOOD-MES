package kr.or.chop.P18_defect.service;

import java.util.List;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface DefService {

	public List<DefDTO> defSelectAll(DefDTO defDTO, PageInfo pageInfo);
	public int selectDefCount(DefDTO defDTO);
	
	int insertDef(DefDTO defDTO);
}
