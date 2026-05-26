package kr.or.chop.P12_rout.dto;

import java.util.List;

import lombok.Data;

@Data
public class ProcDetailDTO {
	
	private String routId;
	private String routName;

	private String procId;
	private String procName;
	private String procContent;

	private String wpTypeNo;
	private String wpTypeName;

	private String eqTypeNo;
	private String eqTypeName;

	private List<ProcRefDTO> wpList;
	private List<ProcRefDTO> eqList;

}
