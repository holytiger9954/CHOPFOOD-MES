package kr.or.chop.P17_vendor.dao;

import java.util.List;

import kr.or.chop.P17_vendor.dto.VendorDTO;

public interface VendorDAO {

	List<VendorDTO> selectVendorList(VendorDTO vendorDTO);
	
}
