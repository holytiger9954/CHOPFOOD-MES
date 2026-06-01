package kr.or.chop.P20_report.io.dto;

import lombok.Data;

@Data
public class IoReportSearchDTO {

    private String startDate;
    private String endDate;

    private String riskLevel;
    private String ioType;
    private String ioReason;
    private String itemKeyword;

    private int currentPage = 1;
}