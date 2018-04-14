package com.baizhi.cmfz.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class AdminLog {

    private String id;

    private String methodName;
    // 日志生成时间
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createDate;
    //执行结果
    private String result;

    private String adminname;
    // 方法执行耗时
    private String methodExcuteDate;

    @Override
    public String toString() {
        return "AdminLog{" +
                "id='" + id + '\'' +
                ", methodName='" + methodName + '\'' +
                ", createDate=" + createDate +
                ", result='" + result + '\'' +
                ", adminname='" + adminname + '\'' +
                ", methodExcuteDate='" + methodExcuteDate + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getMethodExcuteDate() {
        return methodExcuteDate;
    }

    public void setMethodExcuteDate(String methodExcuteDate) {
        this.methodExcuteDate = methodExcuteDate;
    }

    public AdminLog() {
    }

    public AdminLog(String id, String methodName, Date createDate, String result, String adminname, String methodExcuteDate) {
        this.id = id;
        this.methodName = methodName;
        this.createDate = createDate;
        this.result = result;
        this.adminname = adminname;
        this.methodExcuteDate = methodExcuteDate;
    }
}
