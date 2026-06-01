package kr.or.chop.P20_report.inspection.dto;

import lombok.Data;

@Data
public class InspectionReportSearchDTO {

    private String startDate;
    private String endDate;

    private String riskLevel;
    private String equipKeyword;

    private int currentPage = 1;
}