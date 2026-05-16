package kr.or.chop.P18_defect.dto;

import lombok.Data;

@Data
public class DefDTO {

	private String defTypeId;
	private String defTypeName;
	private String defStandardAction;
	private String defUsage;
	
	private String searchType;
	private String searchKeyword;
}
