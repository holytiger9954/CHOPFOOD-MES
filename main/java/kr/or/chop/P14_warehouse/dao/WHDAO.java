package kr.or.chop.P14_warehouse.dao;

import java.util.List;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface WHDAO {

	public int selectWHCount(WHDTO whDTO);
	public List<WHDTO> selectAllWH(WHDTO whDTO, PageInfo pageInfo);
	public WHDTO selectWhCardCnt(WHDTO whDTO);
	
	
	public WHDTO selectWHDTO(WHDTO whDTO);
	public int selectGlogCount(WHDTO whDTO);
	public List<GlogDTO> selectGlogList(WHDTO whDTO);
	
}
