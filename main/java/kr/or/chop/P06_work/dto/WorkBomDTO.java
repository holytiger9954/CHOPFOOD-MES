package kr.or.chop.P06_work.dto;

import lombok.Data;

@Data
public class WorkBomDTO {

	private String bomId;
	
	// 생산제품
	private String pItemId;
	private String pItemName;
	
	// 소요 자재
	private String itemId;
	private String itemName;
	private int itemType;
	private String itemUnit;
	private String itemSpec;
	private String itemUnitPrice;
	
	// 기준 수량
	private int bomQty;
	
	// 작업지시 수량
	private int woQty;
	
	// 총 필요 수량
	private int reqQty;
	
	// 현재 재고
	private String stockId;
	private int stockPrevQty;
	private int stockAvailQty;
	private int stockReserveQty;
	
	// 사용, 반환
	private int usedQty;
	private int returnQty;
}
