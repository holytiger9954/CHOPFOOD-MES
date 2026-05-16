package kr.or.chop.P18_defect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P18_defect.dao.DefDAO;
import kr.or.chop.P18_defect.dto.DefDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class DefServiceImpl implements DefService {

	@Autowired
	DefDAO defDAO;

	@Override
	public List<DefDTO> defSelectAll(DefDTO defDTO, PageInfo pageInfo) {

		return defDAO.selectAllDef(defDTO, pageInfo);
	}

	@Override
	public int selectDefCount(DefDTO defDTO) {

		return defDAO.selectDefCount(defDTO);
	}
	
}
