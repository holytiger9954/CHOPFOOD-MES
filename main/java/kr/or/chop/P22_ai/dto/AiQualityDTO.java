package kr.or.chop.P22_ai.dto;

import lombok.Data;

@Data
public class AiQualityDTO {

    private String aiDataId;

    private String itemId;
    private String processId;
    private String equipmentId;
    private String workplaceId;
    private String workerId;

    private Integer prodQty;
    private Integer defectQty;
    private Double defectRate;

    private Double temperature;
    private Double humidity;

    private Integer equipmentRuntime;

    private String workShift;

    private String riskLevel;

    private String resultYn;

    private String createdAt;
}