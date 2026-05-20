package kr.or.chop.P14_warehouse.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P14_warehouse.dao.WHDAO;
import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P14_warehouse.dto.SecDTO;
import kr.or.chop.P15_workplace.dto.WPDTO;
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
	public List<GlogDTO> selectGlogList(WHDTO whDTO, PageInfo pageInfo) {

		System.out.println("/warehouse/detail service.selectGlogList");

		return whDAO.selectGlogList(whDTO, pageInfo);
	}

	@Override
	public List<SecDTO> selectSecList(WHDTO whDTO) {

		System.out.println("/warehouse/detail service.selectSecList");

		return whDAO.selectSecList(whDTO);
	}

	@Override
	public void insertWH(WHDTO whDTO, MultipartFile whImgFile, String uploadPath, String uploadUrl)
			throws IllegalStateException, IOException {

		System.out.println("/warehouse/add service.insertWH");
		
		// 1. 이미지 없이 먼저 INSERT
	    // insert 후 whDTO 안에 whId가 들어오게 만들어야 함
	    whDAO.insertWH(whDTO);

	    // 1-1. 시퀀스 생성
	    whDAO.createSecSeq(whDTO);

	    // 2. 이미지 없으면 여기서 종료
	    if (whImgFile == null || whImgFile.isEmpty()) {
	        return;
	    }

	    // 3. 업로드 폴더 생성
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    // 4. 확장자 추출
	    String originalName = whImgFile.getOriginalFilename();
	    String ext = originalName.substring(originalName.lastIndexOf("."));

	    // 5. 파일명을 wpId로 생성
	    String savedName = whDTO.getWhId() + "_" + System.currentTimeMillis() + ext;

	    File saveFile = new File(uploadPath, savedName);

	    // 6. 실제 파일 저장
	    whImgFile.transferTo(saveFile);

	    // 7. DB에 이미지 파일명 UPDATE
	    String imgUrl = uploadUrl + "/" + savedName;
	    
	    whDTO.setWhImg(imgUrl);
	    whDAO.updateWhImg(whDTO);
	}

	@Override
	public void updateWH(WHDTO whDTO, MultipartFile whImgFile, String uploadPath, String uploadUrl)
			throws IllegalStateException, IOException {

	    System.out.println("/warehouse/update service.updateWH");

	    // 1. 작업장 기본 정보 먼저 UPDATE
	    whDAO.updateWh(whDTO);

	    // 2. 삭제 버튼을 눌렀고, 새 파일은 선택하지 않은 경우
	    if ("Y".equals(whDTO.getDelImg()) && (whImgFile == null || whImgFile.isEmpty())) {
	        whDTO.setWhImg(null);
	        whDAO.updateWhImg(whDTO);
	        return;
	    }

	    // 3. 새 이미지 선택 안 했으면 종료
	    if (whImgFile == null || whImgFile.isEmpty()) {
	        return;
	    }

	    // 4. 업로드 폴더 생성
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    // 5. 기존 파일 삭제 및 새 파일명 생성
	    if (whDTO.getWhImg() != null && !whDTO.getWhImg().trim().equals("")) {
	        String oldImgUrl = whDTO.getWhImg();
	        String oldFileName = oldImgUrl.substring(oldImgUrl.lastIndexOf("/") + 1);

	        File oldFile = new File(uploadPath, oldFileName);
	        if (oldFile.exists()) {
	            oldFile.delete();
	        }
	    }
	    
	    String originalName = whImgFile.getOriginalFilename();
	    String ext = originalName.substring(originalName.lastIndexOf("."));

	    String savedName = whDTO.getWhId() + "_" + System.currentTimeMillis() + ext;

	    // 6. 실제 파일 저장
	    File saveFile = new File(uploadPath, savedName);
	    whImgFile.transferTo(saveFile);

	    // 7. DB 이미지 URL 수정
	    String imgUrl = uploadUrl + "/" + savedName;
	    whDTO.setWhImg(imgUrl);
	    whDAO.updateWhImg(whDTO);
		
	}
	
	@Override
	public int deleteWh(WHDTO whDTO) {

		System.out.println("/warehouse/delete service.deleteWp");
		
		return whDAO.deleteWh(whDTO);
	}


}
