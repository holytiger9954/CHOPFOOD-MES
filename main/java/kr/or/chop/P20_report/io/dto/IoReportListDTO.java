package kr.or.chop.P20_report.io.dto;

import lombok.Data;

@Data
public class IoReportListDTO {

    private String ioDate;
    private String ioType;
    private String ioReason;

    private String lotId;
    private String itemId;
    private String itemName;

    private int ioQty;
    private int lotQty;
    private int lotFqty;

    private int stockPrevQty;
    private int stockAvailQty;
    private int stockReserveQty;

    private double reserveRate;

    private String riskLevel;
}