package kr.or.chop.P15_workplace.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P14_warehouse.dto.WHDTO;
import kr.or.chop.P15_workplace.dto.WPDTO;
import kr.or.chop.P19_ghp.dto.GhpDTO;
import kr.or.chop.P19_ghp.dto.GlogDTO;

public interface GlogService {
	
	public List<GhpDTO> selectAllGhp (WPDTO wpDTO);
	public List<GhpDTO> selectAllGhpWh (WHDTO whDTO);
	public GhpDTO selectGhp (GhpDTO ghpDTO);
	
	public void insertGlog (GlogDTO glogDTO, MultipartFile ghpImgFile, String uploadPath, String uploadUrl) throws IllegalStateException, IOException;
	public void updateGlog (GlogDTO glogDTO, MultipartFile ghpImgFile, String uploadPath, String uploadUrl) throws IllegalStateException, IOException;
	
	public GlogDTO selectGlog (GlogDTO glogDTO);

	public int deleteGlog (GlogDTO glogDTO);
}
