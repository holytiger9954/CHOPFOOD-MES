package kr.or.chop.P22_ai.dto;

import lombok.Data;

@Data
public class AiInsightDTO {

    private double highRiskRate;

    private double dayAvgDefectRate;
    private double nightAvgDefectRate;

    private String topRiskEquipmentId;
    private double topRiskEquipmentRate;

    private double highTempRiskRate;
}