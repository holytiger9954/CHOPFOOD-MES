package kr.or.chop.P08_stock.dto;

import java.util.List;

import lombok.Data;

@Data
public class StockDTO {

	private String stockId;
    private String stockItem;
    private int stockPrevQty;
    private int stockAvailQty;
    private int stockReserveQty;

    private String itemName;
    private String itemType;
    private int itemSafetyStock;

    private String stockStatus;
    private List<String> stockStatusList;
    
    private String itemUnit;
    private String itemSpec;

    private String searchType;
    private String searchKeyword;
	
}
