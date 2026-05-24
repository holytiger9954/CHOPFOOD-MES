package kr.or.chop.P06_work.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class WorkDTO {
	
	String workId;
	String workPlan;
	
	int workOrderQty;
	Integer workPrevQty;
	
	// 작업지시는 시간 안 따지고 일자까지만 따질 거니까 그냥 date로 했음
	Date workDate;
	
	String workDirector;
	String workDname;
	String workDmsg;
	
	String workWorker;
	String workWname;
	String workWmsg;
	
	int workStatus;
	
	Timestamp workCdate;
	Timestamp workMdate;

}
