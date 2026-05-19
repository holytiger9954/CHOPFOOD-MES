package kr.or.chop.P14_warehouse.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class WHDTO {

	private String whId;
	private String whName;
	private int whTypeNo;
	private String whTypeName;
	
	private int whQty;
	private int whPrevQty = 0;
	
	private String whImg;
	private String whTypeContent;
	
	private Date lastGlogDate;

	private String delImg;
	
	private String ghpId;
	private String ghpName;

	private String searchType;
	private String searchKeyword;
	
	private String cardType;
	private int totalWhCnt;
	private int usingWhCnt;
	private int safeWhCnt;
	private int dangerWhCnt;
	private int overWhCnt;
	
	private double whUsageRate;

}
