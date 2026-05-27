package kr.or.chop.P20_report.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.chop.P20_report.dto.QualityReportListDTO;
import kr.or.chop.P20_report.dto.QualityReportSearchDTO;
import kr.or.chop.P20_report.dto.QualityReportSummaryDTO;
import kr.or.chop.P20_report.dto.ReportSelectDTO;
import kr.or.chop.P20_report.service.QualityReportService;
import kr.or.chop.common.pagination.PageInfo;
import kr.or.chop.common.pagination.Pagination;

@Controller
@RequestMapping("/report")
public class QualityReportController {

    @Autowired
    private QualityReportService qualityReportService;

    @RequestMapping("/quality")
    public String qualityReport(
            QualityReportSearchDTO searchDTO,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            Model model) {

        QualityReportSummaryDTO summary =
                qualityReportService.selectQualitySummary(searchDTO);

        int listCount =
                qualityReportService.selectQualityReportCount(searchDTO);

        PageInfo pageInfo =
                Pagination.getPageInfo(listCount, currentPage, 5, 10);

        List<QualityReportListDTO> qualityList =
                qualityReportService.selectQualityReportList(searchDTO, pageInfo);

        List<ReportSelectDTO> itemList =
                qualityReportService.selectItemList();

        List<ReportSelectDTO> equipmentList =
                qualityReportService.selectEquipmentList();

        List<Map<String, Object>> defectTrendList =
                qualityReportService.selectDefectTrendList(searchDTO);

        List<Map<String, Object>> riskChartList =
                qualityReportService.selectRiskChartList(searchDTO);

        model.addAttribute("summary", summary);
        model.addAttribute("qualityList", qualityList);
        model.addAttribute("itemList", itemList);
        model.addAttribute("equipmentList", equipmentList);
        model.addAttribute("defectTrendList", defectTrendList);
        model.addAttribute("riskChartList", riskChartList);
        model.addAttribute("searchDTO", searchDTO);
        model.addAttribute("page", pageInfo);

        return "P20_report/qualityReport.tiles";
    }
}