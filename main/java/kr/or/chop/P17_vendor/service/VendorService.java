package kr.or.chop.P17_vendor.service;

import java.util.List;

import kr.or.chop.P17_vendor.dto.VendorDTO;

public interface VendorService {

	List<VendorDTO> selectVendorList(VendorDTO vendorDTO);
	
}
