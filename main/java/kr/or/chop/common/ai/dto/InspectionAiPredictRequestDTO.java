package kr.or.chop.common.ai.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class InspectionAiPredictRequestDTO {

    @JsonProperty("inspection_type")
    private String inspectionType;

    @JsonProperty("target_type")
    private String targetType;

    @JsonProperty("inspection_month")
    private int inspectionMonth;

    @JsonProperty("inspection_weekday")
    private int inspectionWeekday;
}