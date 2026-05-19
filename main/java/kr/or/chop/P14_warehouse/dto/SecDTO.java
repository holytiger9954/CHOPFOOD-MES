package kr.or.chop.P14_warehouse.dto;

import lombok.Data;

@Data
public class SecDTO {
	
	private String whSecId;
	private String whSecWhid;
	private int whSecQty;
	private int whSecPrevQty;
	private double whSecUsageRate;
	private String whSecUsage;
	private String whSecImg;

}
