package kr.or.chop.P09_lot.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UseDTO {

	private String useId;
	private String useWork;
	private String useLot;
	private int useQty;
	private Date useDate;
	private String useType;
	private String useMemo;

	private String ioId;
	private String ioType;
	private String ioReason;
	private String ioLot;
	private int ioQty;
	private Date ioDate;
	private String ioMsg;
	
}
