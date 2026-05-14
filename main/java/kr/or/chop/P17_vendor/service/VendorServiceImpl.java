package kr.or.chop.P17_vendor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P17_vendor.dao.VendorDAO;
import kr.or.chop.P17_vendor.dto.VendorDTO;

@Service
public class VendorServiceImpl implements VendorService {

	@Autowired
	private VendorDAO vendorDAO;

	@Override
	public List<VendorDTO> selectVendorList(VendorDTO vendorDTO) {

		return vendorDAO.selectVendorList(vendorDTO);
	}
	
}
