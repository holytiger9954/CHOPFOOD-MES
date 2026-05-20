package kr.or.chop.P12_rout.dto;

import lombok.Data;

@Data
public class RoutDTO {

    private String routId;
    private String routItem;
    private String routName;
    private String routContent;
    private String routUsage;

    private String itemId;
    private String itemName;
    private int itemType;
    private String itemSpec;
    private String itemUnit;

    private String searchType;
    private String searchKeyword;
}