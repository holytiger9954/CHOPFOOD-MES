package kr.or.chop.P12_rout.service;

import java.util.List;

import kr.or.chop.P12_rout.dto.RoutDTO;
import kr.or.chop.P12_rout.dto.RoutDetailDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface RoutService {

	int selectRoutCount(RoutDTO routDTO);

	List<RoutDTO> selectRoutList(RoutDTO routDTO, PageInfo page);

	RoutDTO selectRoutDetail(String routId);

	List<RoutDetailDTO> selectRoutDetailList(String routId);

	List<RoutDTO> selectRoutItemList();

	List<RoutDetailDTO> selectProcessList();

	void insertRoutWithDetail(RoutDTO routDTO, String[] procList);

	void updateRoutWithDetail(RoutDTO routDTO, String[] procList);
}