package com.xemphim.WebXemPhim.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class CommentDTO {
    private int comment_id;
    private String account_name;
    private String comment_content;
    private  int parent_comment_id;
    private long level;
    private String path;

    @JsonFormat(pattern="yyyy-MM-dd HH-mm-ss",timezone="Asia/Ho_Chi_Minh")
    private Date time;

    public CommentDTO(int comment_id, String account_name, String comment_content, int parent_comment_id, long level, String path, Date time) {
        this.comment_id = comment_id;
        this.account_name = account_name;
        this.comment_content = comment_content;
        this.parent_comment_id = parent_comment_id;
        this.level = level;
        this.path = path;
        this.time = time;
    }

    public CommentDTO(int comment_id, String account_name, String comment_content, int parent_comment_id, long level, String path) {
        this.comment_id = comment_id;
        this.account_name = account_name;
        this.comment_content = comment_content;
        this.parent_comment_id = parent_comment_id;
        this.level = level;
        this.path = path;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public int getParent_comment_id() {
        return parent_comment_id;
    }

    public void setParent_comment_id(int parent_comment_id) {
        this.parent_comment_id = parent_comment_id;
    }

    public long getLevel() {
        return level;
    }

    public void setLevel(long level) {
        this.level = level;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
