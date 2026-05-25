package kr.or.chop.P22_ai.dto;

import lombok.Data;

@Data
public class AiPredictHistoryDTO {

    private String predictId;

    private int prodQty;
    private double temperature;
    private double humidity;
    private int equipmentRuntime;
    private int workShiftNum;

    private String riskLevel;
    private String createdAt;
}