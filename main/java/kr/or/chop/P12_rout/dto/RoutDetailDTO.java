package kr.or.chop.P12_rout.dto;

import lombok.Data;

@Data
public class RoutDetailDTO {

    // ROUTING_DETAIL
    private String routDtlId;
    private String routDtlRout;
    private int routDtlStep;
    private String routDtlProc;
    private String routDtlUsage;

    // PROCESS
    private String procId;
    private String procName;
    private String procContent;
    private int procWpType;

    // WP_TYPE
    private int wpTypeNo;
    private String wpTypeName;
    private String wpTypeContent;

    // 설비 목록 문자열
    private String eqNames;

    // 등록/수정 form 배열
    private String[] routDtlProcList;
}