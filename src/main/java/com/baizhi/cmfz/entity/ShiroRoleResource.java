package com.baizhi.cmfz.entity;

import java.io.Serializable;

public class ShiroRoleResource implements Serializable {
    private Integer roleResid;

    private String rolename;

    private Integer resid;

    private static final long serialVersionUID = 1L;

    public Integer getRoleResid() {
        return roleResid;
    }

    public void setRoleResid(Integer roleResid) {
        this.roleResid = roleResid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public Integer getResid() {
        return resid;
    }

    public void setResid(Integer resid) {
        this.resid = resid;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", roleResid=").append(roleResid);
        sb.append(", rolename=").append(rolename);
        sb.append(", resid=").append(resid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}