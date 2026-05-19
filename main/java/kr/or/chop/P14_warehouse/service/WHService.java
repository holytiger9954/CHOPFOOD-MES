package kr.or.chop.P14_warehouse.service;

import java.util.List;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface WHService {

	public List<WHDTO> selectAllWH(WHDTO whDTO, PageInfo pageInfo);
	public int selectWHCount(WHDTO whDTO);
	public WHDTO selectWhCardCnt(WHDTO whDTO);

	public WHDTO selectWhDTO(WHDTO whDTO);
	public int selectGlogCount(WHDTO whDTO);
	public List<GlogDTO> selectGlogList(WHDTO whDTO);
	
}
