package kr.or.chop.P20_report.inspection.dto;

import lombok.Data;

@Data
public class InspectionReportSummaryDTO {

    private int totalInspectionCount;
    private int normalCount;
    private int warningCount;
    private int riskCount;

    private double warningRate;
    private double riskRate;
}