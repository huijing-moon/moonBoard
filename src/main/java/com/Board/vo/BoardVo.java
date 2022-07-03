package com.Board.vo;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVo {

    private Integer idx;
    private String id;
    private String title;
    private String content;
    private String deleteYn;
    private Date date;

}
