package kr.or.chop.P12_rout.dto;

import lombok.Data;

@Data
public class RoutDTO {

    // ROUTING
    private String routId;
    private String routItem;
    private String routName;
    private String routContent;
    private String routUsage;

    // ITEM
    private String itemId;
    private String itemName;
    private int itemType;
    private String itemSpec;
    private String itemUnit;

    // SEARCH
    private String searchType;
    private String searchKeyword;
}