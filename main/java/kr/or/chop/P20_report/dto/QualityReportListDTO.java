package kr.or.chop.P20_report.dto;

import lombok.Data;

@Data
public class QualityReportListDTO {

    private String lotId;
    private String itemName;

    private int qcQty;
    private int qcPassQty;
    private int defectQty;
    private double defectRate;

    private String equipmentId;
    private double temperature;
    private double humidity;
    private int equipmentRuntime;
    private String workShift;
    private String riskLevel;

    private String qcResult;
    private String qcDate;
}