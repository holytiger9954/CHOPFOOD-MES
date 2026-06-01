package kr.or.chop.P20_report.io.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P20_report.io.dto.IoReportListDTO;
import kr.or.chop.P20_report.io.dto.IoReportSearchDTO;
import kr.or.chop.P20_report.io.dto.IoReportSummaryDTO;
import kr.or.chop.P20_report.io.service.IoReportService;
import kr.or.chop.common.ai.dto.IoAiPredictRequestDTO;
import kr.or.chop.common.ai.dto.IoAiPredictResponseDTO;
import kr.or.chop.common.ai.service.IoAiPredictionService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
public class IoReportController {

    @Autowired
    private IoReportService ioReportService;
    
    @Autowired
    private IoAiPredictionService ioAiPredictionService;

    @GetMapping("/report/io")
    public String ioReport(
            IoReportSearchDTO searchDTO,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            Model model) {

        if (searchDTO.getStartDate() == null
                || searchDTO.getStartDate().isEmpty()) {

            searchDTO.setStartDate(
                    LocalDate.now().minusMonths(6).toString());
        }

        if (searchDTO.getEndDate() == null
                || searchDTO.getEndDate().isEmpty()) {

            searchDTO.setEndDate(
                    LocalDate.now().toString());
        }

        IoReportSummaryDTO summary =
                ioReportService.selectIoSummary(searchDTO);

        int listCount =
                ioReportService.selectIoReportCount(searchDTO);

        PageInfo pageInfo =
                Pagination.getPageInfo(
                        listCount,
                        currentPage,
                        5,
                        10);

        List<Map<String, Object>> riskChartList =
                ioReportService.selectIoRiskChartList(searchDTO);

        List<Map<String, Object>> ioTrendList =
                ioReportService.selectIoTrendList(searchDTO);

        List<IoReportListDTO> ioList =
                ioReportService.selectIoReportList(
                        searchDTO,
                        pageInfo);
        
        IoAiPredictResponseDTO aiResult = null;
        String aiErrorMessage = null;

        try {

            IoAiPredictRequestDTO aiRequestDTO =
                    ioReportService.selectIoAiTarget(searchDTO);

            if(aiRequestDTO != null) {

                aiResult =
                        ioAiPredictionService.predict(aiRequestDTO);
            }

        } catch(Exception e) {

            aiErrorMessage =
                    "AI 서버 연결 또는 예측 처리 중 문제가 발생했습니다.";
        }

        model.addAttribute("summary", summary);
        model.addAttribute("riskChartList", riskChartList);
        model.addAttribute("ioTrendList", ioTrendList);
        model.addAttribute("ioList", ioList);

        model.addAttribute("searchDTO", searchDTO);
        model.addAttribute("page", pageInfo);
        
        model.addAttribute("aiResult", aiResult);
        model.addAttribute("aiErrorMessage", aiErrorMessage);

        return "P20_report/io/ioReport.tiles";
    }
}