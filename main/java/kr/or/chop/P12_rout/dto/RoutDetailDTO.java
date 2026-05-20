package kr.or.chop.P12_rout.dto;

import lombok.Data;

@Data
public class RoutDetailDTO {

    private String routDtlId;
    private String routDtlRout;
    private int routDtlStep;
    private String routDtlProc;
    private String routDtlUsage;

    private String procId;
    private String procName;
    private String procContent;
    private String procEqid;

    private String eqId;
    private String eqName;

    private String[] routDtlProcList;
}