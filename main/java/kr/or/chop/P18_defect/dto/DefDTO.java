package kr.or.chop.P18_defect.dto;

import lombok.Data;

@Data
public class DefDTO {

	private int defTypeId;
	private String defTypeName;
	private String defStandardAction;
	
	private String searchType;
	private String searchKeyword;
}
