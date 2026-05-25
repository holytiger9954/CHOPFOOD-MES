package kr.or.chop.P07_qc.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QcDTO {

	private String qcId;
	private String qcLot;
	private String qcType;
	private String qcContent;
	private int qcQty;
	private int qcStatus;
	private Timestamp qcOdate;
	private String qcDirector;
	private String qcDmsg;
	private Timestamp qcDate;
	private String qcWmsg;
	private int qcPassQty;
	private String qcUsage;
	
	private int todayQty;
	private int passQty;
	private int failQty;
	private double failRate;
	
	private String startDate;
	private String endDate;
	private String searchKeyword;
	private String searchType;
	
}
