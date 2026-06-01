package kr.or.chop.P20_report.io.service;

import java.util.List;
import java.util.Map;

import kr.or.chop.P20_report.io.dto.IoReportListDTO;
import kr.or.chop.P20_report.io.dto.IoReportSearchDTO;
import kr.or.chop.P20_report.io.dto.IoReportSummaryDTO;
import kr.or.chop.common.ai.dto.IoAiPredictRequestDTO;
import kr.or.chop.common.pagination.PageInfo;

public interface IoReportService {

	IoReportSummaryDTO selectIoSummary(IoReportSearchDTO searchDTO);

	List<Map<String, Object>> selectIoRiskChartList(IoReportSearchDTO searchDTO);

	List<Map<String, Object>> selectIoTrendList(IoReportSearchDTO searchDTO);

	int selectIoReportCount(IoReportSearchDTO searchDTO);

	List<IoReportListDTO> selectIoReportList(IoReportSearchDTO searchDTO, PageInfo pageInfo);

	IoAiPredictRequestDTO selectIoAiTarget(IoReportSearchDTO searchDTO);
}