package kr.or.chop.P22_ai.dto;

import lombok.Data;

@Data
public class AiSummaryDTO {

    private int totalCount;
    private int highCount;
    private double avgDefectRate;

    private String topRiskEquipmentId;
    private double topRiskEquipmentRate;
}