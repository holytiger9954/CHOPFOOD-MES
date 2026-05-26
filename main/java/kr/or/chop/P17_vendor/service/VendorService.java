package kr.or.chop.P17_vendor.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.chop.P17_vendor.dto.VendorDTO;
import kr.or.chop.P17_vendor.dto.VendorIoDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface VendorService {

    List<VendorDTO> selectVendorList(VendorDTO search, PageInfo pageInfo);

    int selectVendorCount(VendorDTO search);

    void insertVendor(VendorDTO vendor, MultipartFile venImgFile, String uploadPath, String uploadUrl) throws IllegalStateException, IOException;

    VendorDTO selectVendorDetail(String vendorId);

    void updateVendor(VendorDTO vendor, MultipartFile venImgFile, String uploadPath, String uploadUrl) throws IllegalStateException, IOException;

    int deleteVendor(String vendorId);

    int selectVendorIoCount(String vendorId);

    List<VendorIoDTO> selectVendorIoList(String vendorId, PageInfo pageInfo);
    
    List<VendorDTO> selectVendorTypeSummary();
}