package kr.or.chop.P07_qc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P07_qc.dao.QcDAO;
import kr.or.chop.P07_qc.dto.QcDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class QcServiceImpl implements QcService{

	@Autowired
	private QcDAO qcDAO;

	@Override
	public int selectQcCount(QcDTO dto) {
		return qcDAO.selectQcCount(dto);
	}

	@Override
	public List<QcDTO> selectQcList(QcDTO dto, PageInfo pageInfo) {
		return qcDAO.selectQcList(dto, pageInfo);
	}

	@Override
	public QcDTO selectQcSummary(QcDTO dto) {
		return qcDAO.selectQcSummary(dto);
	}

	@Override
	public QcDTO selectQcDetail(String qcId) {
		return qcDAO.selectQcDetail(qcId);
	}

	@Override
	public int insertQc(QcDTO dto) {
		return qcDAO.insertQc(dto);
	}

	@Override
	public int updateQc(QcDTO dto) {
		return qcDAO.updateQc(dto);
	}

	@Override
	public int deleteQc(String qcId) {
		return qcDAO.deleteQc(qcId);
	}
	
	@Override
	public List<QcDTO> selectQcLotList() {
	    return qcDAO.selectQcLotList();
	}
	
	@Override
	public int updateQcResult(QcDTO dto) {
		int result = qcDAO.updateQcResult(dto);

	    if (dto.getQcStatus() == 30) {
	        qcDAO.updateLotByQcResult(dto);
	    }
	    if (dto.getDefectType() != null) {

	        for (int i = 0; i < dto.getDefectType().length; i++) {

	            QcDTO def = new QcDTO();

	            def.setQcId(dto.getQcId());
	            def.setDefType(dto.getDefectType()[i]);
	            def.setDefQty(dto.getDefectQty()[i]);
	            def.setDefAction(dto.getDefectAction()[i]);
	            def.setDefDiscard(dto.getDefectDiscard()[i]);

	            qcDAO.insertDefLog(def);
	        }
	    }

	    return result;
	}
	
	@Override
	public List<QcDTO> selectDefectTypeList() {
	    return qcDAO.selectDefectTypeList();
	}
	
	@Override
	public List<QcDTO> selectWarehouseListByItem(String itemId) {

	    return qcDAO.selectWarehouseListByItem(itemId);

	}

	@Override
	public List<QcDTO> selectSectionListByWarehouse(String whId) {

	    return qcDAO.selectSectionListByWarehouse(whId);

	}

}
