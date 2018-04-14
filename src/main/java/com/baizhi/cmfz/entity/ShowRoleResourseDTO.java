package com.baizhi.cmfz.entity;

import java.util.List;

public class ShowRoleResourseDTO {
    private Integer roleid;
    private String rolename;
    private List<Resourse> list;

    public ShowRoleResourseDTO() {
    }

    @Override
    public String toString() {
        return "ShowRoleResourseDTO{" +
                "roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                ", list=" + list +
                '}';
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public List<Resourse> getList() {
        return list;
    }

    public void setList(List<Resourse> list) {
        this.list = list;
    }

    public ShowRoleResourseDTO(Integer roleid, String rolename, List<Resourse> list) {
        this.roleid = roleid;
        this.rolename = rolename;
        this.list = list;
    }
}
