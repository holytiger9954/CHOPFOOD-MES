package kr.or.chop.P20_report.inspection.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P20_report.inspection.dto.InspectionReportListDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSearchDTO;
import kr.or.chop.P20_report.inspection.dto.InspectionReportSummaryDTO;
import kr.or.chop.P20_report.inspection.service.InspectionReportService;
import kr.or.chop.common.ai.dto.InspectionAiPredictRequestDTO;
import kr.or.chop.common.ai.dto.InspectionAiPredictResponseDTO;
import kr.or.chop.common.ai.service.InspectionAiPredictionService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
public class InspectionReportController {

    @Autowired
    private InspectionReportService inspectionReportService;
    
    @Autowired
    private InspectionAiPredictionService inspectionAiPredictionService;

    @GetMapping("/report/inspection")
    public String inspectionReport(
            InspectionReportSearchDTO searchDTO,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            Model model) {

        if (searchDTO.getStartDate() == null || searchDTO.getStartDate().isEmpty()) {
            searchDTO.setStartDate(LocalDate.now().minusMonths(6).toString());
        }

        if (searchDTO.getEndDate() == null || searchDTO.getEndDate().isEmpty()) {
            searchDTO.setEndDate(LocalDate.now().toString());
        }

        InspectionReportSummaryDTO summary =
                inspectionReportService.selectInspectionSummary(searchDTO);

        int listCount =
                inspectionReportService.selectInspectionReportCount(searchDTO);

        PageInfo pageInfo =
                Pagination.getPageInfo(listCount, currentPage, 5, 10);

        List<Map<String, Object>> riskChartList =
                inspectionReportService.selectInspectionRiskChartList(searchDTO);

        List<Map<String, Object>> inspectionTrendList =
                inspectionReportService.selectInspectionTrendList(searchDTO);

        List<InspectionReportListDTO> inspectionList =
                inspectionReportService.selectInspectionReportList(searchDTO, pageInfo);
        
        InspectionAiPredictResponseDTO aiResult = null;
        String aiErrorMessage = null;

        try {
            InspectionAiPredictRequestDTO aiRequestDTO =
                    inspectionReportService.selectInspectionAiTarget(searchDTO);

            if (aiRequestDTO != null) {
                aiResult = inspectionAiPredictionService.predict(aiRequestDTO);
            }
        } catch (Exception e) {
            aiErrorMessage = "AI 서버 연결 또는 예측 처리 중 문제가 발생했습니다.";
        }

        model.addAttribute("summary", summary);
        model.addAttribute("riskChartList", riskChartList);
        model.addAttribute("inspectionTrendList", inspectionTrendList);
        model.addAttribute("inspectionList", inspectionList);
        model.addAttribute("searchDTO", searchDTO);
        model.addAttribute("page", pageInfo);
        
        model.addAttribute("aiResult", aiResult);
        model.addAttribute("aiErrorMessage", aiErrorMessage);

        return "P20_report/inspection/inspectionReport.tiles";
    }
}