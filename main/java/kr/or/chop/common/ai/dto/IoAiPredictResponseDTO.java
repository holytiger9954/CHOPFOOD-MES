package kr.or.chop.common.ai.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class IoAiPredictResponseDTO {

    @JsonProperty("risk_level")
    private String riskLevel;

    @JsonProperty("low_prob")
    private double lowProb;

    @JsonProperty("warning_prob")
    private double warningProb;

    @JsonProperty("high_prob")
    private double highProb;
}