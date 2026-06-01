package kr.or.chop.common.ai.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class InspectionAiPredictResponseDTO {

    @JsonProperty("risk_level")
    private String riskLevel;

    @JsonProperty("normal_prob")
    private double normalProb;

    @JsonProperty("warning_prob")
    private double warningProb;

    @JsonProperty("risk_prob")
    private double riskProb;
}