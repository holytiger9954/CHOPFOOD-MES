package kr.or.chop.P13_bom.service;

import java.util.List;

import kr.or.chop.P13_bom.dto.BOMDTO;
import kr.or.chop.P13_bom.dto.BOMDetailDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface BOMService {

	// 목록
	List<BOMDTO> selectBomList(BOMDTO bomDTO, PageInfo pageInfo);

	// 개수
	int selectBomCount(BOMDTO bomDTO);

	// 상세
	BOMDTO selectBomDetail(String bomId);

	// 상세 구성품
	List<BOMDetailDTO> selectBomDetailList(String bomId);

	// 완제품 목록
	List<BOMDTO> selectFinishItemList();

	// 자재 목록
	List<BOMDTO> selectMaterialItemList();

	// 등록
	int insertBom(BOMDTO bomDTO);

	// 구성품 등록
	int insertBomDetail(BOMDetailDTO detailDTO);

	// 수정
	int updateBom(BOMDTO bomDTO);

	// BOM 논리삭제
	int deleteBom(String bomId);

	// DETAIL 논리삭제
	int deleteBomDetailByBomId(String bomId);
}