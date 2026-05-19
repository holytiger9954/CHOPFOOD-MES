package kr.or.chop.P14_warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P14_warehouse.dao.WHDAO;
import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class WHServiceImpl implements WHService {
	
	@Autowired
	WHDAO whDAO;

	@Override
	public List<WHDTO> selectAllWH(WHDTO whDTO, PageInfo pageInfo) {

		System.out.println("/warehouse/list service.selectAllWH");
		
		return whDAO.selectAllWH(whDTO, pageInfo);
	}

	@Override
	public int selectWHCount(WHDTO whDTO) {

		System.out.println("/warehouse/list service.selectWHCount");
		
		return whDAO.selectWHCount(whDTO);
	}

	@Override
	public WHDTO selectWhCardCnt(WHDTO whDTO) {
		
		System.out.println("/warehouse/list service.selectWhCardCnt");
		
		return whDAO.selectWhCardCnt(whDTO);
	}

	@Override
	public WHDTO selectWhDTO(WHDTO whDTO) {

		System.out.println("/warehouse/detail service.selectWhDTO");
		
		return whDAO.selectWHDTO(whDTO);
	}

	@Override
	public int selectGlogCount(WHDTO whDTO) {

		System.out.println("/warehouse/detail service.selectGlogCount");

		return whDAO.selectGlogCount(whDTO);
	}

	@Override
	public List<GlogDTO> selectGlogList(WHDTO whDTO) {

		System.out.println("/warehouse/detail service.selectGlogList");

		return whDAO.selectGlogList(whDTO);
	}

}
