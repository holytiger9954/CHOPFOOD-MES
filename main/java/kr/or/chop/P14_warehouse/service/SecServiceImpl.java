package kr.or.chop.P14_warehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P14_warehouse.dao.SecDAO;
import kr.or.chop.P14_warehouse.dto.SecDTO;

@Service
public class SecServiceImpl implements SecService {

	@Autowired
	SecDAO secDAO;
	
	@Override
	public SecDTO selectWhSecDTO(SecDTO secDTO) {
		return secDAO.selectWhSecDTO(secDTO);
	}

}
