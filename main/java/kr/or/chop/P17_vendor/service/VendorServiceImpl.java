package kr.or.chop.P17_vendor.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P17_vendor.dao.VendorDAO;
import kr.or.chop.P17_vendor.dto.VendorDTO;
import kr.or.chop.P17_vendor.dto.VendorIoDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class VendorServiceImpl implements VendorService {

	@Autowired
	private VendorDAO vendorDAO;

	@Override
	public List<VendorDTO> selectVendorList(VendorDTO search, PageInfo pageInfo) {
		return vendorDAO.selectVendorList(search, pageInfo);
	}

	@Override
	public int selectVendorCount(VendorDTO search) {
		return vendorDAO.selectVendorCount(search);
	}

//	@Override
//	public int insertVendor(VendorDTO vendor) {
//		return vendorDAO.insertVendor(vendor);
//	}

	@Override
	public VendorDTO selectVendorDetail(String vendorId) {
		return vendorDAO.selectVendorDetail(vendorId);
	}

//	@Override
//	public int updateVendor(VendorDTO vendor) {
//		return vendorDAO.updateVendor(vendor);
//	}

	@Override
	public int deleteVendor(String vendorId) {
		return vendorDAO.deleteVendor(vendorId);
	}

	@Override
	public int selectVendorIoCount(String vendorId) {
		return vendorDAO.selectVendorIoCount(vendorId);
	}

	@Override
	public List<VendorIoDTO> selectVendorIoList(String vendorId, PageInfo pageInfo) {
		return vendorDAO.selectVendorIoList(vendorId, pageInfo);
	}

	@Override
	public List<VendorDTO> selectVendorTypeSummary() {
		return vendorDAO.selectVendorTypeSummary();
	}

	@Override
	public void insertVendor(VendorDTO vendor, MultipartFile venImgFile, String uploadPath, String uploadUrl)
			throws IllegalStateException, IOException {
		vendorDAO.insertVendor(vendor);
		
		if (venImgFile == null || venImgFile.isEmpty()) {
			return;
		}
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		String originalName = venImgFile.getOriginalFilename();
	    String ext = originalName.substring(originalName.lastIndexOf("."));
	    
	    String savedName = vendor.getVendorId() + "_" + System.currentTimeMillis() + ext;
	    File saveFile = new File(uploadPath, savedName);
	    
	    venImgFile.transferTo(saveFile);
	    
	    String imgUrl = uploadUrl + "/" + savedName;
	    vendor.setVendorImg(imgUrl);
	    
	    vendorDAO.updateVenImg(vendor);
	    
	}

	@Override
	public void updateVendor(VendorDTO vendor, MultipartFile venImgFile, String uploadPath, String uploadUrl)
			throws IllegalStateException, IOException {
		
		vendorDAO.updateVendor(vendor);
		
		if ("Y".equals(vendor.getDelImg()) && (venImgFile == null || venImgFile.isEmpty())) {
	        vendor.setVendorImg(null);
	        vendorDAO.updateVenImg(vendor);
	        return;
	    }
		
		File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }
		
	    if (vendor.getVendorImg() != null && !vendor.getVendorImg().trim().equals("")) {
	        String oldImgUrl = vendor.getVendorImg();
	        String oldFileName = oldImgUrl.substring(oldImgUrl.lastIndexOf("/") + 1);

	        File oldFile = new File(uploadPath, oldFileName);
	        if (oldFile.exists()) {
	            oldFile.delete();
	        }
	    }
	    
	    String originalName = venImgFile.getOriginalFilename();
	    String ext = originalName.substring(originalName.lastIndexOf("."));

	    String savedName = vendor.getVendorId() + "_" + System.currentTimeMillis() + ext;

	    File saveFile = new File(uploadPath, savedName);
	    venImgFile.transferTo(saveFile);
	    
	    String imgUrl = uploadUrl + "/" + savedName;
	    
	    vendor.setVendorImg(imgUrl);
	    
	    vendorDAO.updateVenImg(vendor);
	    
	}
}