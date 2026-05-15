package kr.or.chop.P15_workplace.dao;

import java.util.List;

import kr.or.chop.P15_workplace.dto.WPDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface WPDAO {
	
	int selectWPCount(WPDTO wpDTO);
	List<WPDTO> selectAllWP(WPDTO wpDTO, PageInfo pageInfo);

}
