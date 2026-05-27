package kr.or.chop.P23_alarm.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlarmDTO {

	private String alarmId;

	private String alarmEmp;
	private Integer alarmDept;
	private Integer alarmAuth;
	private Integer alarmTypeNo;

	private String alarmTitle;
	private String alarmContent;
	private Timestamp alarmDate;
	private String alarmValid;

	private String targetType;
	private String targetName;

	private String empName;
	private String deptName;
	private String authName;
	private String alarmTypeName;

	private String searchKeyword;
	
}
