package kr.or.chop.common.ai.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class IoAiPredictRequestDTO {

    @JsonProperty("io_qty")
    private double ioQty;

    @JsonProperty("lot_qty")
    private double lotQty;

    @JsonProperty("lot_fqty")
    private double lotFqty;

    @JsonProperty("item_type")
    private int itemType;

    @JsonProperty("item_unit_price")
    private double itemUnitPrice;

    @JsonProperty("io_month")
    private int ioMonth;

    @JsonProperty("io_weekday")
    private int ioWeekday;
}