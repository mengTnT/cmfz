package com.baizhi.cmfz.entity;

public class Resourse {
    private  int id;
    private String resname;
    private String resurl;
    private String restype;
    private String rescode;
    private int parent_id;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResname() {
        return resname;
    }

    public void setResname(String resname) {
        this.resname = resname;
    }

    public String getResurl() {
        return resurl;
    }

    public void setResurl(String resurl) {
        this.resurl = resurl;
    }

    public String getRestype() {
        return restype;
    }

    public void setRestype(String restype) {
        this.restype = restype;
    }

    public String getRescode() {
        return rescode;
    }

    public void setRescode(String rescode) {
        this.rescode = rescode;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public Resourse(int id, String resname, String resurl, String restype, String rescode, int parent_id) {
        this.id = id;
        this.resname = resname;
        this.resurl = resurl;
        this.restype = restype;
        this.rescode = rescode;
        this.parent_id = parent_id;
    }

    public Resourse() {
    }

    @Override
    public String toString() {
        return "Resourse{" +
                "id=" + id +
                ", resname='" + resname + '\'' +
                ", resurl='" + resurl + '\'' +
                ", restype='" + restype + '\'' +
                ", rescode='" + rescode + '\'' +
                ", parent_id=" + parent_id +
                '}';
    }
}
