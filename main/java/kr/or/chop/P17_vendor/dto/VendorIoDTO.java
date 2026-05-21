package kr.or.chop.P17_vendor.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VendorIoDTO {

    private String ioId;
    private String ioType;
    private String itemId;
    private String itemName;
    private String ioReason;
    private Timestamp ioDate;
    private int ioQty;
    private String ioLot;
}