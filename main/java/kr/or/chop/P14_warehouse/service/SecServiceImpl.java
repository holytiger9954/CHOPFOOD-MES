package kr.or.chop.P14_warehouse.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P09_lot.dto.LotDTO;
import kr.or.chop.P14_warehouse.dao.SecDAO;
import kr.or.chop.P14_warehouse.dto.SecDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class SecServiceImpl implements SecService {

	@Autowired
	SecDAO secDAO;
	
	@Override
	public SecDTO selectSecDTO(SecDTO secDTO) {
		return secDAO.selectSecDTO(secDTO);
	}

	@Override
	public int selectLotCount(SecDTO secDTO) {
		return secDAO.selectLotCount(secDTO);
	}

	@Override
	public List<LotDTO> selectLotList(SecDTO secDTO, PageInfo pageInfo) {
		return secDAO.selectLotList(secDTO, pageInfo);
	}

	@Override
	public void deleteSection(SecDTO secDTO) {
		secDAO.minusWhQty(secDTO);
		secDAO.deleteSection(secDTO);
	}

	@Override
	public void insertSection(SecDTO secDTO, MultipartFile secImgFile, String uploadPath, String contextPath) throws IllegalStateException, IOException {
		// 1. 이미지 없이 먼저 INSERT
		secDAO.insertSection(secDTO);
		
		String secId = secDTO.getSecId();
		
		// 1-1. 창고 수용량 업뎃
		secDAO.plusWhQty(secDTO);
		
		// 2. 이미지 없으면 종료
		if (secImgFile == null || secImgFile.isEmpty()) {
			return;
		}
		
		// 3. 업로드 폴더 생성
		File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }
	    
	    // 4. 확장자 추출
	    String originalName = secImgFile.getOriginalFilename();
	    String ext = originalName.substring(originalName.lastIndexOf("."));
	    
	    // 5. 파일명 생성
	    String savedName = secId + ext;
	    
	    File saveFile = new File(uploadPath, savedName);
	    
	    // 6. 실제 파일 저장
	    secImgFile.transferTo(saveFile);
	    
	    // 7. DB에 이미지 파일명 update
	    String imgUrl = contextPath + "/resources/img/P14_warehouse/section/" + savedName;
	    
	    secDTO.setSecImg(imgUrl);
	    secDAO.updateSecImg(secDTO);
		
	}

}
