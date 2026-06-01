package kr.or.chop.P20_report.io.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chop.P20_report.io.dao.IoReportDAO;
import kr.or.chop.P20_report.io.dto.IoReportListDTO;
import kr.or.chop.P20_report.io.dto.IoReportSearchDTO;
import kr.or.chop.P20_report.io.dto.IoReportSummaryDTO;
import kr.or.chop.common.ai.dto.IoAiPredictRequestDTO;
import kr.or.chop.common.pagination.PageInfo;

@Service
public class IoReportServiceImpl implements IoReportService {

	@Autowired
	private IoReportDAO ioReportDAO;

	@Override
	public IoReportSummaryDTO selectIoSummary(IoReportSearchDTO searchDTO) {
		return ioReportDAO.selectIoSummary(searchDTO);
	}

	@Override
	public List<Map<String, Object>> selectIoRiskChartList(IoReportSearchDTO searchDTO) {
		return ioReportDAO.selectIoRiskChartList(searchDTO);
	}

	@Override
	public List<Map<String, Object>> selectIoTrendList(IoReportSearchDTO searchDTO) {
		return ioReportDAO.selectIoTrendList(searchDTO);
	}

	@Override
	public int selectIoReportCount(IoReportSearchDTO searchDTO) {
		return ioReportDAO.selectIoReportCount(searchDTO);
	}

	@Override
	public List<IoReportListDTO> selectIoReportList(IoReportSearchDTO searchDTO, PageInfo pageInfo) {
		return ioReportDAO.selectIoReportList(searchDTO, pageInfo);
	}

	@Override
	public IoAiPredictRequestDTO selectIoAiTarget(IoReportSearchDTO searchDTO) {

		return ioReportDAO.selectIoAiTarget(searchDTO);
	}
}