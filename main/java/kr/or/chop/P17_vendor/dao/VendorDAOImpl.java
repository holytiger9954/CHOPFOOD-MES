package kr.or.chop.P17_vendor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chop.P17_vendor.dto.VendorDTO;

@Repository
public class VendorDAOImpl implements VendorDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<VendorDTO> selectVendorList(VendorDTO vendorDTO) {

		return sqlSession.selectList(
				"mapper.P17_vendor.selectVendorList",
				vendorDTO
		);
	}
	
}
