package kr.or.chop.P20_report.io.dto;

import lombok.Data;

@Data
public class IoReportSummaryDTO {

    private int totalIoQty;
    private int totalLotQty;
    private int totalLotFqty;

    private int lowCount;
    private int warningCount;
    private int highCount;

    private double warningRate;
    private double highRate;
}