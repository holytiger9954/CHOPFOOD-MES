package kr.or.chop.P01_login.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P01_login.dto.EmpDTO;
import kr.or.chop.P01_login.dto.UserWorkDTO;
import kr.or.chop.P04_sugg.dto.SuggDTO;

public interface MyService {
	
	public List<UserWorkDTO> selectAllWork(EmpDTO loginUser);
	public List<SuggDTO> selectAllSugg(EmpDTO loginUser);
	
	public void updateUser(EmpDTO empDTO, MultipartFile empImgFile, String uploadPath, String uploadUrl) throws IllegalStateException, IOException;

	public EmpDTO reSelectUserInfo(EmpDTO loginUser);
}
