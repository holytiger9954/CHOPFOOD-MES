package kr.or.chop.P18_defect.dao;

import java.util.List;

import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface DefDAO {

	List<DefDTO> selectAllDef(DefDTO defDTO, PageInfo pageInfo);
	int selectDefCount(DefDTO defDTO);
	
	int insertDef(DefDTO defDTO);
}
